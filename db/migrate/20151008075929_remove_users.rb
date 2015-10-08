class RemoveUsers < ActiveRecord::Migration
  def change
    drop_table :users
    remove_column :treatments, :user_id
  end
end
