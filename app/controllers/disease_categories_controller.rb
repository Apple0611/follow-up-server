class DiseaseCategoriesController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @roots = DiseaseCategory.roots
  end

  def view
    @category = DiseaseCategory.find(params[:id].to_i)
    @children = @category.children.order(py_acronym: :desc)
    @ancestors = @category.ancestors

    @diseases = @category.diseases
  end

  def children
    id = params[:id].to_i
    if id == 0
      @children = DiseaseCategory.roots.select(:id, :name)
    else
      @children = DiseaseCategory.find(id).children.select(:id, :name)
    end
    render json: @children
  end

  private
  def record_not_found
    render file: 'public/404.html', status: 404, layout: false
  end

end
