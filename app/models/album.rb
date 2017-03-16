class Album < ActiveRecord::Base
  validates :name, presence: true
  validates :votes, numericality: { only_integer: true, greater_than_or_equal_to: 0}
end
