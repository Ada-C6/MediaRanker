class Book < ActiveRecord::Base
  validates :name, presence: true
    def upvote
      self.ranking += 1
      self.save
    end
end
