class Book < ActiveRecord::Base

  def self.top_ten
    return Book.order(upvotes: :desc).limit(10)
  end

end
