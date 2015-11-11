class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.column :name, :string
      t.column :description, :string
      t.column :age_from, :integer
      t.column :age_from_units, :string
      t.column :age_to, :integer
      t.column :age_to_units, :string
      t.column :available, :boolean
      t.column :position, :integer
      t.column :daycare_id, :integer

      t.timestamps null: false
    end
  end
end
