class Album < ActiveRecord::Base

  def upvote
    self.vote += 1
  end
  
end
