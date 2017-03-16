class Book < ActiveRecord::Base
  validates :name, presence: true

  def upvote
    self.rank += 1
    self.save
  end
  
end
