require 'test_helper'

class BookTest < ActiveSupport::TestCase
  	test "An book must have a name" do 
	  	a_book=Book.new
	  	
	  	assert_not a_book.valid? "An book without a name is invalid."
	    a_book.name = "One flew over a cuckoo's nest"
	    a_book.valid?  "Somehow #{a_book.name}is not a valid name."
  	end

  	test "You can't escape was by Fellow" do
  		assert_equal books(:nap).author, "Dr. Suess"
  	end
end
