class Book < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true
  validates :synopsis, presence: true
end
