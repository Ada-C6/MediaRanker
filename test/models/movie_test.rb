require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "An Movie must be valid" do
    assert movies(:one).valid?,  "an Movie must have a name"
    assert movies(:three).valid?,  "an Movie must have a name"

    movies(:one).name = nil   # This only happens in this test
    assert_not movies(:one).valid?  # this is based on validations in : app/models/movie.rb
  end

  test "An Movie must have a name" do
    item = Movie.new

    assert_not item.valid?, "An Item without a name is invalid."
    item.name = "Gardens"
    assert item.valid?, "More than just a name must be required..."
  end

  test "Movie 1 has the correct title " do
    assert_equal movies(:one).name,  "movie1",  "The Movie must have the correct"
  end

end
