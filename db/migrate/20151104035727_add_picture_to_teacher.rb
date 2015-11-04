class AddPictureToTeacher < ActiveRecord::Migration
  def change
    add_attachment :teachers, :picture
  end
end
