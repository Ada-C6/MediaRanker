class Movie < Medium
  validates :director, presence: true
  after_initialize :init
  def init
    self.director ||= ""
    self.votes ||= 0
  end
end
