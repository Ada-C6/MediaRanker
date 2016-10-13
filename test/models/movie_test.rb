require 'test_helper'

class MovieTest < ActiveSupport::TestCase

  test "Create a Movie with valid data" do
    movie = Movie.new(name: "foo")
    assert movie.valid?
  end

  test "Should reject a movie with no name" do
    movie = Movie.new
    assert_not movie.valid?
  end

  test "Create two albums with different names" do
    movie1 = Movie.create!(name: "Boo!")
    movie2 = Movie.new(name: "Moo!")
    assert movie2.valid?
  end

  test "Should reject an movie with a name that already exists" do
    movie1 = Movie.create!(name: "Boo!")
    movie2 = Movie.new(name: "Boo!")
    assert_not movie2.valid?
  end

end
