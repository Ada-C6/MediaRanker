require 'test_helper'

class MovieTest < ActiveSupport::TestCase

  test "Cannot create a movie without a name" do
    movie = Movie.new
    assert_not movie.valid?
    assert_not movies(:three).valid?
  end

  #test cannot create two books of the same name?

end
