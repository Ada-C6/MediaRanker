class Album < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :artist, presence: true
end
