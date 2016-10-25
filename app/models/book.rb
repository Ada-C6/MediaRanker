class Book < ActiveRecord::Base
  validates :author, presence: true
  validates :name, presence: true, uniqueness: true
end
