require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "A Movie should have a title" do
    assert_not movies(:movie2).valid? "A book without a title is invalid"
    movies(:movie2).title = "Title"
    assert movies(:movie2).valid? "For some reason the title is not valid"
  end

  test "A Movie does not need a director or description" do
    assert movies(:movie3).valid? "A movie without a director and description is valid"
  end
end
