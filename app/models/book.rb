class Book < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :description, :written_by, presence: true
end
