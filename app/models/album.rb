class Album < ActiveRecord::Base
  validates :name, presence: true
  validates :artist, presence: true
  validates :rank, presence: true, :numericality => { :greater_than_or_equal_to => 0, only_integer: true }

end
