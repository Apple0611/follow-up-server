class AddCategoryRefToDiseases < ActiveRecord::Migration
  def change
    add_reference :diseases, :category, index: true
  end
end
