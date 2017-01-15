class ChangeCreatedUpdatedTimesToDates < ActiveRecord::Migration
  def change
    change_column :events, :created_at, :date, :null => false
    change_column :events, :updated_at, :date, :null => false
  end
end
