class Song < ActiveRecord::Base

  validates :title, presence: true, uniqueness: { scope: [:artist] }
  validates :artist, presence: true
  validates :rank, presence: true
end
