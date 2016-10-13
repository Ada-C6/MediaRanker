class Album < ActiveRecord::Base
  validates :name, presence: true
  validates :artist, presence: true

  def self.sort_by_rank
    order('rank DESC')
  end
end
