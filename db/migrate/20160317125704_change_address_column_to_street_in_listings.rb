class ChangeAddressColumnToStreetInListings < ActiveRecord::Migration
  def change
    remove_column :listings, :address, :string
    add_column :listings, :street, :string
  end
end
