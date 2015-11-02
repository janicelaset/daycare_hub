class ChangeAddressToBelongToDaycare < ActiveRecord::Migration
  def change
    add_column :addresses, :daycare_id, :integer
    remove_column :addresses, :contact_id, :integer
    remove_column :contacts, :name, :string
    remove_column :contacts, :address, :string
    remove_column :contacts, :city, :string
    remove_column :contacts, :state, :string
    remove_column :contacts, :zip, :string
  end
end
