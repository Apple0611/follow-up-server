class DiseasesController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def view
    @view = Disease.find(params[:id].to_i)
    @disease_category = @view.disease_category
  end

  private
  def record_not_found
    render file: 'public/404.html', status: 404, layout: false
  end

end
