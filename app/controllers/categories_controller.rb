class CategoriesController < ApplicationController

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

  def children
    id = params[:id].to_i
    if id == 0
      @children = Category.roots.select(:id, :name)
    else
      @children = Category.find(id).children.select(:id, :name)
    end
    render json: @children
  end

  private
  def record_not_found
    render file: 'public/404.html', status: 404, layout: false
  end

end
