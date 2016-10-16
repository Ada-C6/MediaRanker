class Book < Medium
  validates :author, presence: true
  after_initialize :init
  def init
    self.author ||= ""
  end
end
