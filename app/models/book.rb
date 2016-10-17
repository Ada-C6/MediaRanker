class Book < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true
    validates :description, length: { maximum: 808 }
    validates :votes, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    def upvote_one
        self[:votes] += 1
        return self.save
    end
end
