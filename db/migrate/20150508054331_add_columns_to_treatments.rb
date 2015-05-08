class AddColumnsToTreatments < ActiveRecord::Migration
  def change
    add_column :treatments, :name, :string
    add_column :treatments, :description, :text
  end
end
