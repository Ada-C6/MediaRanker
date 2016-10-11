class Album < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :description, :recorded_by, presence: true
end
