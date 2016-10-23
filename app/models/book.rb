class Book < ActiveRecord::Base

  validates :title, presence: true, uniqueness: { scope: [:author] }
  validates :author, presence: true
  validates :rank, presence: true


  def upvote
    self.rank += 1
    self.save
  end

  def downvote
    self.rank -= 1
    self.save
  end

end
