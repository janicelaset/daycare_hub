class CreateCertifications < ActiveRecord::Migration
  def change
    create_table :certifications do |t|
      t.column :name, :string
      t.column :link, :string
      t.column :description, :string
      t.column :position, :integer
      t.column :daycare_id, :integer
      t.attachment :image

      t.timestamps null: false
    end
  end
end
