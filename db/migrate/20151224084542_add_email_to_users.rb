class AddEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    remove_column :users, :username, :string
    remove_column :users, :password, :string
  end
end
