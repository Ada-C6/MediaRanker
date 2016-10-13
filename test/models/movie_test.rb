require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Create a Movie with valid data" do
    movie = Movie.new(name: "foo")
    assert movie.valid?

  end

end
