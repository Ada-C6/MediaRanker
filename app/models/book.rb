class Book < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: :author }
end
