class Album < ActiveRecord::Base
    def upvote_one
        self[:rank] += 1
    end
end
