class ChangeDaycareType < ActiveRecord::Migration
  def change
    remove_column :daycares, :type, :string
    add_column :daycares, :structure, :string
  end
end
