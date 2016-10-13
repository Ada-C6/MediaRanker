class Album < ActiveRecord::Base
  validates :title, presence: true
  validates :artist, presence: true
  validates :synopsis, presence: true
end
