class Bob < ActiveRecord::Base
  has_many :bob_votes, dependent: :destroy
  validates :name, presence: true
end
