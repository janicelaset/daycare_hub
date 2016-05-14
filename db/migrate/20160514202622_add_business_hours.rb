class AddBusinessHours < ActiveRecord::Migration
  def change
    add_column :generals, :mon_open, :string
    add_column :generals, :tues_open, :string
    add_column :generals, :wed_open, :string
    add_column :generals, :thurs_open, :string
    add_column :generals, :fri_open, :string
    add_column :generals, :sat_open, :string
    add_column :generals, :sun_open, :string
    add_column :generals, :mon_close, :string
    add_column :generals, :tues_close, :string
    add_column :generals, :wed_close, :string
    add_column :generals, :thurs_close, :string
    add_column :generals, :fri_close, :string
    add_column :generals, :sat_close, :string
    add_column :generals, :sun_close, :string
  end
end
