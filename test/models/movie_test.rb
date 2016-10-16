require 'test_helper'

class MovieTest < ActiveSupport::TestCase

  test "Create a movie with all data" do
  movie = Movie.new(name: "Scream", director: "Bill Smith", description: "Horror")
  assert movie.valid?
end

  test "Create a movie with just all required data" do
  movie = Movie.new(name: "Scream")
  assert movie.valid?
end

test "Cannot create a movie with only unrequired data" do
  movie = Movie.new(director: "Bill Smith", description: "Horror")
  assert_not movie.valid?
end

test "Activating upvote method adds 1 to the movie.ranking" do
  movie = movies(:top_gun)
  movie.upvote
  assert_equal movie.ranking, 1
  end
end
