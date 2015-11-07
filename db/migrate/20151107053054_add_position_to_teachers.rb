class AddPositionToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :position, :integer
  end
end
