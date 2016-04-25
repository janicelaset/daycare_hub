class AddListingIdToDaycares < ActiveRecord::Migration
  def change
    add_column :daycares, :listing_id, :integer
  end
end
