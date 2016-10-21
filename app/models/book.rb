class Book < Medium
  validates :author, presence: true
  after_initialize :init
  def init
    self.author ||= ""
    self.votes ||= 0
  end
end
