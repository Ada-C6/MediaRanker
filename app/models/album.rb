class Album < ActiveRecord::Base
  validates :name, presence: true
  validates :artist, presence: true
  validates :description, presence: true
  validates :votes, numericality: { only_integer: true }
end
