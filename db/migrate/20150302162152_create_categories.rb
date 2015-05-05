class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.string :name_py
      t.string :py_abbr

      t.timestamps null: false
    end
  end
end
