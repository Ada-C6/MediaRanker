class Book < ActiveRecord::Base
  validates :name, presence: true
  validates :author, presence: true
  validates :description, allow_nil: true, length: { in: 0..150 }
  validates :rank, presence: true, :numericality => { :greater_than_or_equal_to => 0, only_integer: true }
end
