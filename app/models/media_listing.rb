class MediaListing < ActiveRecord::Base
  validates :name, presence: true
  validates :type, presence: true

end
