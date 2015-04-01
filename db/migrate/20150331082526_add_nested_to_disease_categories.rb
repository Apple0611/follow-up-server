class AddNestedToDiseaseCategories < ActiveRecord::Migration
  def change

    rename_column :disease_categories, :parent, :parent_id
    rename_column :disease_categories, :level, :depth
    
    add_column :disease_categories, :lft, :integer
    add_column :disease_categories, :rgt, :integer
    add_column :disease_categories, :children_count, :integer

    DiseaseCategory.rebuild!
  end
end
