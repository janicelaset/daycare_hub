class AddIndexToUrl < ActiveRecord::Migration
  def change
    add_index :daycares, :url
  end
end
