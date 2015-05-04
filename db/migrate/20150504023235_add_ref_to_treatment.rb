class AddRefToTreatment < ActiveRecord::Migration
  def change
    add_reference :treatments, :disease, index: true
    add_reference :treatments, :user, index: true
  end
end
