class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @page_title = "全部分类"
    @category = Category.new
    sorter
  end

  def show
    @page_title = @category.name
    @departments = @category.departments
    @ancestors = @category.ancestors
    sorter
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
    @category = Category.find(params[:id].to_i)
  end

  def category_params
    params.require(:category).permit(:id, :parent_id, :name, :name_en, :common, :description)
  end

  def sorter
    @sorter = [
      ['默认排序', '/categories', ''],
      ['拼音A-Z', '/categories/by/pinyin', ''],
      ['热门程度', '/categories/by/hot', ''],
      ['科室数量', '/categories/by/count', '']]

    case params[:by_method]
    when "pinyin"
      @roots = Category.where('depth = 0').order(:py_abbr)
      @sorter[1][2] = 'active'
    when "hot"
      @roots = Category.where('depth = 0').order(:children_count)
      @sorter[2][2] = 'active'
    when "count"
      @roots = Category.where('depth = 0').order(:children_count)
      @sorter[3][2] = 'active'
    else
      @roots = Category.roots
      @sorter[0][2] = 'active'
    end
  end

  def record_not_found
    render file: 'public/404.html', status: 404, layout: false
  end
end
