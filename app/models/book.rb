class Book < ActiveRecord::Base
  validates :name, presence: true
  validates :author, presence: true
  validates :description, presence: true
  validates :votes, numericality: { only_integer: true }

end
