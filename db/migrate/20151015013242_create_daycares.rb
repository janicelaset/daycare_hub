class CreateDaycares < ActiveRecord::Migration
  def change
    create_table :daycares do |t|
      t.column :name, :string
      t.column :type, :string
      t.column :summary, :string

      t.timestamps null: false
    end
  end
end
