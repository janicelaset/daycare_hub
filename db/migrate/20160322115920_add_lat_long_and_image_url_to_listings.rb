class AddLatLongAndImageUrlToListings < ActiveRecord::Migration
  def change
    add_column :listings, :latitude, :float
    add_column :listings, :longitude, :float
    add_column :listings, :image_url, :string
  end
end
