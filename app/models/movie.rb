class Movie < ActiveRecord::Base
  validates_presence_of :name, :director, :description
end
