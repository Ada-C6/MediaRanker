class Album < ActiveRecord::Base
  belongs_to :medium
  validates :name, presence: true, uniqueness: true
end
