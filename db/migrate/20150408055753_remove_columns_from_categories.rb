class RemoveColumnsFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :is_active, :boolean
    remove_column :categories, :is_empty, :boolean
    remove_column :categories, :is_bottom, :boolean
  end
end
