class Book < ActiveRecord::Base

  def upvote
    self.rank += 1
    self.save
  end
end
