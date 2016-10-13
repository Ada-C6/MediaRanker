class Book < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: { scope: :author, :message => "This book with this author has already been created" }
  validates :author, presence: true
  validates :description, presence: true
end
