class Album < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :artist, presence: true
  validates :description, presence: true
end
