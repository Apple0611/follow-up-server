class AddNestedToCategories < ActiveRecord::Migration
  def change

    rename_column :categories, :parent, :parent_id
    rename_column :categories, :level, :depth
    
    add_column :categories, :lft, :integer
    add_column :categories, :rgt, :integer

    Category.rebuild!

    add_column :categories, :children_count, :integer

  end
end
