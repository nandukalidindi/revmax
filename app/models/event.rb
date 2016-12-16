class Event < ActiveRecord::Base
  self.inheritance_column = :_type_custom
  # 
  # validates :start_time, uniqueness: true
  # validates :end_time, uniqueness: true
  # validates :email, uniqueness: true

  def self.schema_fields
    []
  end
end
