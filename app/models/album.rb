class Album < ActiveRecord::Base

	def upvote
    self.rank += 1
    self.save
  end
  # title cannot be blank
	validates :title, presence: true
	# creator cannot be blank
	validates :creator, presence: true
	# description cannot be blank
	validates :description, presence: true
end
