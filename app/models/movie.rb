class Movie < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: :director }
  validates :director, presence: true
  validates :description, presence: true
end
