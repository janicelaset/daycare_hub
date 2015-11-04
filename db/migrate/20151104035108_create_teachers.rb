class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.column :name, :string
      t.column :about, :string
      t.column :daycare_id, :integer

      t.timestamps null: false
    end
  end
end
