class Book < ActiveRecord::Base
  belongs_to :medium
  # validates :title, presence: true, uniqueness: true
  # validates :author, presence: true
  # validates :description, presence: true

end
