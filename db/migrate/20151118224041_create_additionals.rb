class CreateAdditionals < ActiveRecord::Migration
  def change
    create_table :additionals do |t|
      t.column :title, :string
      t.column :content, :string
      t.column :position, :integer
      t.column :daycare_id, :integer
      t.attachment :image

      t.timestamps null: false
    end
  end
end
