class RemoveUrlAndImageFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :url, :string
    drop_attached_file :listings, :picture
    add_column :listings, :daycare_id, :integer
  end
end
