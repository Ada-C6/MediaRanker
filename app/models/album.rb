class Album < ActiveRecord::Base
  validates :name, presence: true
  validates :artist, presence: true
  validates :rank_points, presence: true


end
