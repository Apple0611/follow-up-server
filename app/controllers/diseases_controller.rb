class DiseasesController < ApplicationController

  def index
    @diseases = Disease.all    
    @disease_category = DiseaseCategory.new
    @disease_category.id = 1
    @disease_category.name = "呼吸系统疾病"
  end

end
