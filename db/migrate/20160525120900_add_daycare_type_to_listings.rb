class AddDaycareTypeToListings < ActiveRecord::Migration
  def change
    add_column :listings, :daycare_type, :string
  end
end
