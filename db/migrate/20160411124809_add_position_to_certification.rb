class AddPositionToCertification < ActiveRecord::Migration
  def change
    add_column :certifications, :position, :integer
  end
end
