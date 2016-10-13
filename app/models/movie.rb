class Movie < ActiveRecord::Base

  validates :title, presence: true, uniqueness: { scope: [:director] }
  validates :director, presence: true
  validates :rank, presence: true
end
