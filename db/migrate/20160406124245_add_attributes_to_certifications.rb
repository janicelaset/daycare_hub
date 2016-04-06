class AddAttributesToCertifications < ActiveRecord::Migration
  def change
    add_column :certifications, :verified, :boolean
    add_column :certifications, :state, :string
  end
end
