class Movie < ActiveRecord::Base
  def upvote
    self.ranked += 1
  end
end
