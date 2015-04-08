class RemoveColumnsFromDiseaseCategories < ActiveRecord::Migration
  def change
    remove_column :disease_categories, :is_active, :boolean
    remove_column :disease_categories, :is_empty, :boolean
    remove_column :disease_categories, :is_bottom, :boolean
  end
end
