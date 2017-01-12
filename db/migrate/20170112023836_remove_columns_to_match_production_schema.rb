class RemoveColumnsToMatchProductionSchema < ActiveRecord::Migration
  def change
    add_column :events, :geometry, :string
    add_column :events, :venue_capacity, :integer
  end
end
