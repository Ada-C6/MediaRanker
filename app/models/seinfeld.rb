class Seinfeld < ActiveRecord::Base

  validates :title, presence: true
  validates :season, presence: true
  validates :episode, presence: true
  validates :rank, presence: true


end
