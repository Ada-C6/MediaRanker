class Movie < ActiveRecord::Base
  validates :director, presence: true
  validates :name, presence: true, uniqueness: true
end
