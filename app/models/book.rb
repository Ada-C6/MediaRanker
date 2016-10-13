class Book < ActiveRecord::Base

  validates :title, presence: true, uniqueness: { scope: [:author] }
  validates :author, presence: true
  validates :rank, presence: true
end
