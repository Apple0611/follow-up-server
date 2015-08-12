class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @page_title = "全部分类"
    @roots = Category.roots
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id].to_i)
    @page_title = @category.name
    if @category.type == "Department"
      @department = @category.becomes(Department)
      @ancestors = @department.ancestors
      @diseases = @department.diseases
      render 'department/show'
    else
      @departments = @category.departments
      @ancestors = @category.ancestors
      render 'show'
    end
  end

  def dep_new
    @category = Category.find(params[:id].to_i)
    @page_title = "在分类" + @category.name + "下新建科室"

    @department = @category.becomes(Department)
    @ancestors = @department.ancestors

    render 'department/edit'
  end

  def dep_edit
    @category = Category.find(params[:id].to_i)
    @page_title = "编辑：" + @category.name

    @department = @category.becomes(Department)
    @ancestors = @department.ancestors

    render 'department/edit'
  end

  def select
    id = params[:id].to_i
    if id == 0
      @children = Category.roots.select(:id, :name)
    else
      @children = Category.find(id).children.select(:id, :name)
    end
    render json: @children
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { redirect_to action: :index}
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to (@category), flash:{type: 'positive', message: '分类已更新'}}
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { redirect_to (@category), flash:{type: 'negative', message: '失败：' + @category.errors.messages.first[1][0]}}
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @category[:children_count] > 0
      respond_to do |format|
        format.html { redirect_to (@category), flash: {type: 'negative', message: '分类不为空，不能直接删除'} }
        format.json { head :no_content }
      end
    else
      @category.destroy
      respond_to do |format|
        format.html { redirect_to ({action: :index}), flash: {type: 'positive', message: '分类已删除'} }
        format.json { head :no_content }
      end
    end
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:id, :parent_id, :name, :name_en, :common, :description)
  end

  def record_not_found
    render file: 'public/404.html', status: 404, layout: false
  end
end
