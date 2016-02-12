class AddUserNameToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :user_name, :string, :unique => true
  end
end
