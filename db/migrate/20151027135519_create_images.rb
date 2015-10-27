class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.column :daycare_id, :integer
      t.column :description, :string
      t.attachment :picture

      t.timestamps null: false
    end
  end
end
