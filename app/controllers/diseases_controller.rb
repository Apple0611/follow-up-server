class DiseasesController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def view
    @disease = Disease.find(params[:id].to_i)
    @category = @disease.disease_category
    @ancestors = @category.self_and_ancestors
  end

  private
  def record_not_found
    render file: 'public/404.html', status: 404, layout: false
  end

end
