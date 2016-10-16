class Movie < Medium
  validates :director, presence: true
  after_initialize :init
  def init
    self.director ||= "" 
  end
end
