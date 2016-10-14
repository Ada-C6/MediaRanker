class Album < ActiveRecord::Base
  validates :name, presence: true, uniqueness:
    { scope: :artist }
    # message: "This album has already been added" }
  validates :artist, presence: true
  validates :description, presence: true, length:
    { maximum: 1000,
    too_long: "%{count} characters is the maximum allowed" }
  validates :upvotes, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

end
