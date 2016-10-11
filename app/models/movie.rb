class Movie < ActiveRecord::Base

  def self.top_ten
    return Movie.order(upvotes: :desc).limit(10)
  end

  def self.all_ranked
    return Movie.order(upvotes: :desc)
  end

end
