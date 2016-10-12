require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	test "An album must have a name" do 
	  	an_album=Album.new
	  	
	  	assert_not an_album.valid? "An album without a name is invalid."
	    an_album.name = "Somewhere over the rainbow"
	    an_album.valid?  "Somehow #{album.name}is not a valid name."
  	end
end
