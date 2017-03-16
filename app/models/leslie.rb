class Leslie < ActiveRecord::Base
  has_many :leslie_votes, dependent: :destroy
  validates :title, presence: true, uniqueness: true
end
