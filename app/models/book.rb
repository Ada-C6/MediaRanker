class Book < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :author, presence: true
end
