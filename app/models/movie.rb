class Movie < ActiveRecord::Base

  validates :title, presence: true
  validates :director, presence: true
  validates :genre, presence: true
  validates :rank, presence: true
end
