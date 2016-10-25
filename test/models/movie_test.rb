require 'test_helper'

class MovieTest < ActiveSupport::TestCase
 	test "A movie must have a name" do 
	  	a_movie=Movie.new
	  	
	  	assert_not a_movie.valid? "A movie without a name is invalid."
	    a_movie.name = "Day of reckoning"
	    a_movie.valid?  "Somehow #{a_movie.name}is not a valid name."
  	end

  	test "You can't escape was by Fellow" do
  		assert_equal movies(:dead_or_alive).director, "G. Allen"
  	end
end
