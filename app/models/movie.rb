class Movie < ActiveRecord::Base
  validates :title, presence: true
  validates :director, presence: true
  validates :rank, numericality: {greater_than_or_equal_to: 0}
end
