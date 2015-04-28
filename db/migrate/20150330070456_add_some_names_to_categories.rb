class AddSomeNamesToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :icd, :string
    add_column :categories, :name_en, :string
    add_column :categories, :en_acronym, :string
    add_column :categories, :name_py, :string
    add_column :categories, :py_acronym, :string
  end
end
