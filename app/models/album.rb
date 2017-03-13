class Album < ActiveRecord::Base
  validates :name, presence: true

  def creator_type
    return "artist"
  end

  def creator_job
    return "written"
  end
end
