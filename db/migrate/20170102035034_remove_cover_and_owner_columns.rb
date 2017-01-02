class RemoveCoverAndOwnerColumns < ActiveRecord::Migration
  def change
    remove_column :events, :owner
    remove_column :events, :cover
  end
end
