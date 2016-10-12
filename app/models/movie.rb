class Movie < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :director, presence: true
end
