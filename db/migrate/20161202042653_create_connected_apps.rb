class CreateConnectedApps < ActiveRecord::Migration
  def change
    create_table :connected_apps do |t|
      t.string :name
      t.string :access_token

      t.timestamps null: false
    end
  end
end
