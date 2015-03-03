class DiseaseCategoriesController < ApplicationController
  before_action :set_disease_category, only: [:show, :edit, :update, :destroy]

  # GET /disease_categories
  # GET /disease_categories.json
  def index
    @disease_categories = DiseaseCategory.all
  end

  # GET /disease_categories/1
  # GET /disease_categories/1.json
  def show
  end

  # GET /disease_categories/new
  def new
    @disease_category = DiseaseCategory.new
  end

  # GET /disease_categories/1/edit
  def edit
  end

  # POST /disease_categories
  # POST /disease_categories.json
  def create
    @disease_category = DiseaseCategory.new(disease_category_params)

    respond_to do |format|
      if @disease_category.save
        format.html { redirect_to @disease_category, notice: 'Disease category was successfully created.' }
        format.json { render :show, status: :created, location: @disease_category }
      else
        format.html { render :new }
        format.json { render json: @disease_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disease_categories/1
  # PATCH/PUT /disease_categories/1.json
  def update
    respond_to do |format|
      if @disease_category.update(disease_category_params)
        format.html { redirect_to @disease_category, notice: 'Disease category was successfully updated.' }
        format.json { render :show, status: :ok, location: @disease_category }
      else
        format.html { render :edit }
        format.json { render json: @disease_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disease_categories/1
  # DELETE /disease_categories/1.json
  def destroy
    @disease_category.destroy
    respond_to do |format|
      format.html { redirect_to disease_categories_url, notice: 'Disease category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disease_category
      @disease_category = DiseaseCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disease_category_params
      params.require(:disease_category).permit(:name, :description, :parent, :level, :is_active, :is_empty, :is_bottom)
    end
end
