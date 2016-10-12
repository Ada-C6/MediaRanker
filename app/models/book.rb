class Book < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: :author }
  validates :author, presence: true
  validates :description, presence: true
end
