class AddSomeNamesToDiseaseCategories < ActiveRecord::Migration
  def change
    add_column :disease_categories, :icd, :string
    add_column :disease_categories, :name_en, :string
    add_column :disease_categories, :en_acronym, :string
    add_column :disease_categories, :name_py, :string
    add_column :disease_categories, :py_acronym, :string
  end
end
