class Drop < ActiveRecord::Migration
  def change
    drop_table :new_user_mailers
  end
end
