class ChangeDaycareCertPositionToListOrder < ActiveRecord::Migration
  def change
    remove_column :daycare_certifications, :position, :integer
    add_column :daycare_certifications, :list_order, :integer
  end
end
