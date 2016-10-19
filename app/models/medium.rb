class Medium < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true

  def upvote
    self.votes += 1
  end

  def url_params
    {media_type: media_type, id: id }
  end
end
