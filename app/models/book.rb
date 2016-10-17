class Book < ActiveRecord::Base
  validates :name, presence: true
  validates :author, presence: true
  validates :rank_points, presence: true
end
