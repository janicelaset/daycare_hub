class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.column :content, :string
      t.column :daycare_id, :integer

      t.timestamps null: false
    end
  end
end
