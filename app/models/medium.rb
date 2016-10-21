class Medium < ActiveRecord::Base
  validates :name, presence: true
  after_initialize :init
end
