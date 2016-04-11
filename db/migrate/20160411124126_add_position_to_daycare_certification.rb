class AddPositionToDaycareCertification < ActiveRecord::Migration
  def change
    add_column :daycare_certifications, :position, :integer
    remove_column :certifications, :position, :integer
  end
end
