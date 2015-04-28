class UpdateColumnOfCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :common, :integer
    add_column :categories, :common, :boolean
  end
end
