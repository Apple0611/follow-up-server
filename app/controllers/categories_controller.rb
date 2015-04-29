class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @roots = Category.roots
  end

  def show
    @category = Category.find(params[:id].to_i)
    @children = @category.children.order(py_acronym: :desc)
    @ancestors = @category.ancestors

    @diseases = @category.diseases
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

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
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
