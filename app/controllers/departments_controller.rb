class DepartmentsController < ApplicationController

  before_action :set_department, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index 

  end

  def show
    @page_title = @department.name
    @category = @department.category
    @ancestors = @department.ancestors
    @diseases = @department.diseases
  end

  def new
    @category = Category.find(params[:id].to_i)
    @ancestors = @category.ancestors
    @page_title = "在分类" + @category.name + "下新建科室"

    @department = Department.new
    @department.category = @category
    @department.parent_id = @category.id
  end

  def create
    @department = Department.create(department_params)
    @category = Category.find(@department.parent_id)
    respond_to do |format|
      if @department.add_to_child_of @category
        format.html { redirect_to @department, notice: 'Department was successfully created.' }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { redirect_to action: :index}
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @category = Category.find(params[:id].to_i)
    @page_title = "编辑：" + @category.name

    @department = @category.becomes(Department)
    @ancestors = @department.ancestors
  end

  def update
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to (@department), flash:{type: 'positive', message: '科室已更新'}}
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { redirect_to (@department), flash:{type: 'negative', message: '失败：' + @department.errors.messages.first[1][0]}}
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @categoty = @department.category
    @department.remove_from_parent
    @department.destroy
    respond_to do |format|
      format.html { redirect_to (@categoty), flash: {type: 'positive', message: '科室已删除'} }
      format.json { head :no_content }
    end
  end

  private
  def set_department
    @department = Department.find(params[:id])
  end

  def department_params
    params.require(:department).permit(:id, :parent_id, :name, :description)
  end

  def record_not_found
    render file: 'public/404.html', status: 404, layout: false
  end
end
