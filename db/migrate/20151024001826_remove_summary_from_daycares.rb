class RemoveSummaryFromDaycares < ActiveRecord::Migration
  def change
    remove_column :daycares, :summary, :string
  end
end
