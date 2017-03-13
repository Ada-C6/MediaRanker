class Movie < ActiveRecord::Base
  validates :name, presence: true

  def creator_type
    return "director"
  end

  def creator_job
    return "directed"
  end
end
