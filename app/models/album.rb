class Album < ActiveRecord::Base
  validates :artist, presence: true
  validates :name, presence: true, uniqueness: true
end
