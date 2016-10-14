class Book < ActiveRecord::Base

  def upvote
    self.upvotes += 1
    self.save
  end
end
