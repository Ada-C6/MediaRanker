class Movie < ActiveRecord::Base
  validates :name, presence: true
  validates :director, presence: true
  validates :description, presence: true
  validates :votes, numericality: { only_integer: true }
end
