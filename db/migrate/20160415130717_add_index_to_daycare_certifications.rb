class AddIndexToDaycareCertifications < ActiveRecord::Migration
  def change
    add_index :daycare_certifications, [:daycare_id, :certification_id]
  end
end
