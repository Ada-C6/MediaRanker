class Movie < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :director, presence: true
  validates :description, presence: true
  validates :ranking, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end
