class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.column :name, :string
      t.column :address, :string
      t.column :city, :string
      t.column :state, :string
      t.column :zip, :string
      t.column :phone, :string
      t.column :url, :string
      t.attachment :picture
      t.column :verified, :boolean

      t.timestamps null: false
    end
  end
end
