class AddCategoryRefToDiseases < ActiveRecord::Migration
  def change
    add_reference :diseases, :disease_category, index: true
  end
end
