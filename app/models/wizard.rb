class Wizard < ActiveRecord::Base
  has_many :wizard_votes, dependent: :destroy
  validates :title, presence: true
end
