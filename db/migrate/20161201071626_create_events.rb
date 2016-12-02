class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :description
      t.string :page

      t.timestamps null: false
    end
  end
end
