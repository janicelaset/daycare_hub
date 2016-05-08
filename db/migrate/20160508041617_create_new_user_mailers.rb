class CreateNewUserMailers < ActiveRecord::Migration
  def change
    create_table :new_user_mailers do |t|

      t.timestamps null: false
    end
  end
end
