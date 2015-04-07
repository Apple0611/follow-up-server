class AddIndexesToDiseaseCategories < ActiveRecord::Migration
  def change
    add_column :disease_categories, :common, :integer
    add_column :disease_categories, :viewed, :integer

  end
end
