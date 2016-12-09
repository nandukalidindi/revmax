class AddAdditionalFieldsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :fid, :integer
    add_column :events, :attending_count, :integer
    add_column :events, :can_guests_invite, :boolean
    add_column :events, :category, :string
    add_column :events, :cover, :jsonb
    add_column :events, :declined_count, :integer
    add_column :events, :guest_list_enabled, :boolean
    add_column :events, :interested_count, :integer
    add_column :events, :is_canceled, :boolean
    add_column :events, :is_page_owned, :boolean
    add_column :events, :is_viewer_admin, :boolean
    add_column :events, :maybe_count, :integer
    add_column :events, :noreply_count, :integer
    add_column :events, :parent_group, :string
    add_column :events, :owner, :jsonb
    add_column :events, :ticket_uri, :string
    add_column :events, :timezone, :string
    add_column :events, :end_time, :datetime
    add_column :events, :updated_time, :datetime
    add_column :events, :type, :string
  end
end
