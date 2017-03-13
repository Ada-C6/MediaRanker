class Book < ActiveRecord::Base
  validates :name, presence: true

  def creator_type
    return "author"
  end

  def creator_job
    return "written"
  end

end
