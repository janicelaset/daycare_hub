class AddDaycareIdToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :daycare_id, :integer
  end
end
