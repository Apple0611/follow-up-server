class DiseaseCategoriesController < ApplicationController

  def index
  end

  def view
    @disease_category = DiseaseCategory.new
    @disease_category.id = 1
    @disease_category.name = "呼吸系统疾病"
  end

end
