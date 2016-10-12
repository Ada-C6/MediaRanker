class Book < ActiveRecord::Base
  validates :title, presence: true
  validates :by, presence: true
end
