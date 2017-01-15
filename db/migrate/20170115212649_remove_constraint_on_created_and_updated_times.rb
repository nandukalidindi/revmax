class RemoveConstraintOnCreatedAndUpdatedTimes < ActiveRecord::Migration
  def change
    change_column :events, :created_at, :date, :null => true
    change_column :events, :updated_at, :date, :null => true
  end
end
