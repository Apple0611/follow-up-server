class AddRefToUser < ActiveRecord::Migration
  def change
    add_reference :users, :treatment, index: true
    add_reference :users, :docotr, index: true
  end
end
