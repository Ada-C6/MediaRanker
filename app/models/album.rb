class Album < ActiveRecord::Base

  def upvote
    self.ranking += 1
    self.save
  end
end
