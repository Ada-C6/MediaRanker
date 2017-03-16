class Album < ActiveRecord::Base
  validates_presence_of :name, :recorded_by, :description
end
