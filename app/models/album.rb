class Album < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description length: {maximum: 100}
end
