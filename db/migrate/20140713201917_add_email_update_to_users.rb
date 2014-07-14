class AddEmailUpdateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_update, :boolean
  end
end
