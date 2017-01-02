class ReorderColumnsForEvents < ActiveRecord::Migration
  def change
    change_column :events, :venue_longitude, :string, after: :handle
    change_column :events, :venue_latitude, :string, after: :handle
    change_column :events, :venue_country, :string, after: :handle
    change_column :events, :venue_state, :string, after: :handle
    change_column :events, :venue_city, :string, after: :handle
    change_column :events, :venue_name, :string, after: :handle
    change_column :events, :venue_fid, :string, after: :handle
  end
end
