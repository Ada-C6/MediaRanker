class Book < ActiveRecord::Base
  validates :title, presence: true
  validates :rank, presence: true
end
