require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "Create a movie w/ valid data" do
    assert movies(:charlottes_web).valid?
  end

  test "Create an album with no name" do
    movie = Movie.new
    assert_not movie.valid?
  end
end
