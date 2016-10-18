class Movie < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :director, presence: true
end
