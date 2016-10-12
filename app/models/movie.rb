class Movie < ActiveRecord::Base
  belongs_to :medium
  validates :name, presence: true, uniqueness: true
  validates :director, presence: true
  validates :description, presence: true
end
