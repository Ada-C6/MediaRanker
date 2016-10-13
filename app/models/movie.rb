class Movie < ActiveRecord::Base
  validates :name, presence: true
  validates :description, allow_nil: true, length: { in: 0..70 }
end
