class DiseasesController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def show
    @disease = Disease.find(params[:id])
    @page_title = @disease.name
    @department = @disease.department
    @ancestors = @department.ancestors
    @treatments = @disease.treatments.paginate(page: params[:page])
  end

  private
  def record_not_found
    render file: 'public/404.html', status: 404, layout: false
  end

end
