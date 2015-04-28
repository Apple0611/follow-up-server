class AddIndexesToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :common, :integer
    add_column :categories, :viewed, :integer

  end
end
