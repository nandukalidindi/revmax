class AddHandleToEvents < ActiveRecord::Migration
  def change
    add_column :events, :handle, :string
  end
end
