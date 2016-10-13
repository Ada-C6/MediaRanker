class Book < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true

  def self.sort_by_rank
    order('rank DESC')
  end

end
