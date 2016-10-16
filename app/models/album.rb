class Album < Medium
  validates :artist, presence: true
  after_initialize :init
  def init
    self.artist ||= ""
    self.votes ||= 0
  end
end
