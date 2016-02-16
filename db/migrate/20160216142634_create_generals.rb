class CreateGenerals < ActiveRecord::Migration
  def change
    create_table :generals do |t|
      t.column :licensed, :boolean
      t.column :type_of_daycare, :string
      t.column :year_opened, :integer
      t.column :daycare_id, :integer

      t.timestamps null: false
    end
  end
end
