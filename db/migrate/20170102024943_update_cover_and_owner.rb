class UpdateCoverAndOwner < ActiveRecord::Migration
  def change
    add_column :events, :owner_name, :string
    add_column :events, :cover_source, :string
  end
end
