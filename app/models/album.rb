class Album < ActiveRecord::Base
  validates :title, presence: true
  validates :artist, presence: true
  validates :description, presence: true

end
