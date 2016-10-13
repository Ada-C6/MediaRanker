class Album < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true
    validates :description, length: { maximum: 808 }

    def upvote_one
        self[:votes] += 1
        return self.save
    end
end
