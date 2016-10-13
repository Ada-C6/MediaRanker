class Book < ActiveRecord::Base
  belongs_to :medium
  validates :title, presence: true, uniqueness: true
end
