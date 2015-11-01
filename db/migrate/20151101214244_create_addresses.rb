class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.column :street, :string
      t.column :city, :string
      t.column :state, :string
      t.column :zip, :string
      t.column :latitude, :float
      t.column :longitude, :float

      t.timestamps null: false
    end
  end
end
