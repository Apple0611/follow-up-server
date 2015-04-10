class UpdateColumnOfDiseaseCategories < ActiveRecord::Migration
  def change
    remove_column :disease_categories, :common, :integer
    add_column :disease_categories, :common, :boolean
  end
end
