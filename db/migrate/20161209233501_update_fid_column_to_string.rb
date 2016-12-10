class UpdateFidColumnToString < ActiveRecord::Migration
  def change
    change_column :events, :fid, :string
  end
end
