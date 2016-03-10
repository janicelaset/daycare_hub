class CreateDaycareCertifications < ActiveRecord::Migration
  def change
    create_table :daycare_certifications do |t|
      t.column :daycare_id, :integer
      t.column :certification_id, :integer

      t.timestamps null: false
    end
  end
end
