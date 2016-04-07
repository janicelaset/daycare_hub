class AddCertificationCreatedBy < ActiveRecord::Migration
  def change
    add_column :certifications, :created_by, :integer
  end
end
