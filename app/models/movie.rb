class Movie < ActiveRecord::Base
  validates :name, presence: true
  validates :director, presence: true
  validates :rank_points, presence: true
end
