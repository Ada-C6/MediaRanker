class LeslieNielson < ActiveRecord::Base
  has_many :votes, dependent: :destroy
end
