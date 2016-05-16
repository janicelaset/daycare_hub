class AddHoursAndWebsiteRemoveOpenClose < ActiveRecord::Migration
  def change
    remove_column :generals, :mon_open, :string
    remove_column :generals, :tues_open, :string
    remove_column :generals, :wed_open, :string
    remove_column :generals, :thurs_open, :string
    remove_column :generals, :fri_open, :string
    remove_column :generals, :sat_open, :string
    remove_column :generals, :sun_open, :string
    remove_column :generals, :mon_close, :string
    remove_column :generals, :tues_close, :string
    remove_column :generals, :wed_close, :string
    remove_column :generals, :thurs_close, :string
    remove_column :generals, :fri_close, :string
    remove_column :generals, :sat_close, :string
    remove_column :generals, :sun_close, :string
    add_column :generals, :hours, :string
    add_column :generals, :website, :string
  end
end
