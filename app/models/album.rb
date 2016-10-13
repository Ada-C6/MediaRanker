class Album < ActiveRecord::Base
    def upvote_one
        self[:votes] += 1
        return self.save
    end
end
