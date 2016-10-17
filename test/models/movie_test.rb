require 'test_helper'

class MovieTest < ActiveSupport::TestCase

  test "Cannot create a movie without a name" do
    movie = Movie.new
    assert_not movie.valid?
    assert_not movies(:three).valid?
  end

  test "cannot create two movies of the same name" do
    movie1 = Movie.create!(name: "Who Cares?")
    movie2 = Movie.new(name: "Who Cares?")
    assert_not movie2.valid?
  end
end
