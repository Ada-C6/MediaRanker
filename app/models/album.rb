class Album < Medium
  validates :artist, presence: true
end
