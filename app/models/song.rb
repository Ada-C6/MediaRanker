class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :artist, presence: true
  validates :genre, presence: true
  validates :rank, presence: true
end
