class Book < ActiveRecord::Base

  def upvote
    self.vote += 1
  end
  
end
