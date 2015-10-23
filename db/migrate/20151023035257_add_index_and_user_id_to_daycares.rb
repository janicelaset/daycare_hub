class AddIndexAndUserIdToDaycares < ActiveRecord::Migration
  def change
    add_column :daycares, :user_id, :integer
    add_index :daycares, :user_id
  end
end
