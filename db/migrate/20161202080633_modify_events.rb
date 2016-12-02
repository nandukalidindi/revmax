class ModifyEvents < ActiveRecord::Migration
  def change
    remove_column :events, :page, :string
    add_column :events, :name, :string
    add_column :events, :place, :jsonb
    add_column :events, :start_time, :datetime
  end
end
