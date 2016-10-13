class Book < ActiveRecord::Base
  validates :name, presence: true
  validates :author, presence: true
  validates :description, allow_nil: true, length: { in: 0..70 }
end
