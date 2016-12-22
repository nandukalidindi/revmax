class ExplodePlaceInEvents < ActiveRecord::Migration
  def change
    add_column :events, :venue_fid, :string
    add_column :events, :venue_name, :string
    add_column :events, :venue_city, :string
    add_column :events, :venue_state, :string
    add_column :events, :venue_country, :string
    add_column :events, :venue_latitude, :string
    add_column :events, :venue_longitude, :string
    remove_column :events, :place
  end
end
