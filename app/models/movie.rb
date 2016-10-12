class Movie < ActiveRecord::Base

  	validates :name, presence: true
  	validates :director, presence: true
end
