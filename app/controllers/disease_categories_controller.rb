class DiseaseCategoriesController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @roots = DiseaseCategory.roots
  end

  def view
    @view = DiseaseCategory.find(params[:id].to_i)
    @children = @view.children.order(py_acronym: :desc)
    @count = @children.count
  end

  private
  def record_not_found
    render file: 'public/404.html', status: 404, layout: false
  end

end
