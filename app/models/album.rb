class Album < ActiveRecord::Base

  def self.top_ten
    return Album.order(upvotes: :desc).limit(10)
  end

end
