class Album < Medium
  validates :artist, presence: true
  after_initialize :init
  def init
    self.artist ||= ""
  end
end
