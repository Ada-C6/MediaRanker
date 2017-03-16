class Album < ActiveRecord::Base
  validates :title, presence: true

  def upvote
    self.num_votes += 1
    self.save
  end

end
