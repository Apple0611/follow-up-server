class AddAttributesToDiseases < ActiveRecord::Migration
  def change
    add_column :diseases, :image, :text
    add_column :diseases, :alt_name, :string
    add_column :diseases, :cause, :string
  end
end
