class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.integer :parent
      t.integer :level
      t.boolean :is_active
      t.boolean :is_empty
      t.boolean :is_bottom

      t.timestamps null: false
    end
  end
end
