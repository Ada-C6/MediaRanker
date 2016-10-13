class Album < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: { scope: :artist, :message => "This album with this artist has already been created" }
  validates :artist, presence: true
  validates :description, presence: true
end
