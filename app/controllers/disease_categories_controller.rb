class DiseaseCategoriesController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @category_top = DiseaseCategory.roots
  end

  def view
    @disease_category = DiseaseCategory.find(params[:id].to_i)
  end

  private
  def record_not_found
    render file: 'public/404.html', status: 404, layout: false
  end

end
