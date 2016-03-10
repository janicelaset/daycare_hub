class RemoveDaycareIdFromCertification < ActiveRecord::Migration
  def change
    remove_column :certifications, :daycare_id, :integer
  end
end
