class RemoveAuthFieldsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :email, :string
    remove_column :users, :crypted_password, :string
    remove_column :users, :salt, :string
    remove_column :users, :remember_me_token, :string
    remove_column :users, :remember_me_token_expires_at, :datetime
    remove_column :users, :activation_state, :string
    remove_column :users, :activation_token, :string
    remove_column :users, :activation_token_expires_at, :datetime
  end
end
