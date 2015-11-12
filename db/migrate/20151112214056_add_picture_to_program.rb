class AddPictureToProgram < ActiveRecord::Migration
  def change
    add_attachment :programs, :picture
  end
end
