class AddDaycareLicenseType < ActiveRecord::Migration
  def change
    remove_column :generals, :licensed, :boolean
    add_column :generals, :license, :string
  end
end
