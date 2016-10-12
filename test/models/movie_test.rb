require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "Can create a movie with valid data" do
    movie = Movie.new(name: "The Godfather", director: "Martin Scorcese", description: "Mob movie I've never seen")
    assert movie.valid?
  end

  test "Cannot create two movies with the same title" do
    movie1 = Movie.create!(name: "Goodfellas", director: "Martin Scorcese", description: "Mob movie I've never seen")
    movie2 = Movie.new(name: "Goodfellas", director: "Scorcese", description: "I've never seen this movie")
    assert_not movie2.valid?
  end

  test "Can create two movies with different titles" do
    movie1 = Movie.create!(name: "Goodfellas", director: "Martin Scorsese", description: "Mob movie I've never seen")
    movie2 = Movie.new(name: "Raging Bull", director: "Martin Scorsese", description: "I've never seen this movie")
    assert movie2.valid?
  end
  # test "the truth" do
  #   assert true
  # end
end
