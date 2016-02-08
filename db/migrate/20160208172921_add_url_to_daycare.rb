class AddUrlToDaycare < ActiveRecord::Migration
  def change
    add_column :daycares, :url, :string
  end
end
