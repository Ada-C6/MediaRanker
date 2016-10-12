class Album < ActiveRecord::Base
  belongs_to :medium
  validates :name, presence: true, uniqueness: true
  validates :artist, presence: true
  validates :description, presence: true
end
