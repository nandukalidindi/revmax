class Event < ActiveRecord::Base
  self.inheritance_column = :_type_custom

  def self.schema_fields
    []
  end
end
