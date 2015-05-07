class AddDepartmentRefToDisease < ActiveRecord::Migration
  def change
    add_reference :diseases, :department, index: true
  end
end
