class Book < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :author, presence: true

  def upvote
    self.rank += 1
  end
end
