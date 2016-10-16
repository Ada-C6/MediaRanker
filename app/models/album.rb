class Album < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: :artist }
end
