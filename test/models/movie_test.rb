require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "Create a movie w/ valid data" do
    assert movies(:charlottes_web).valid?
  end

  test "Create a movie with no name" do
    movie = Movie.new
    assert_not movie.valid?
  end

  test "Create a movie with the same name as another" do
    movie1 = Movie.create!(name: "foo", director: "hi")
    movie2 = Movie.new(name: "foo")
    assert movie2.valid?
  end

  test "Create a movie with the same name and director as another" do
    movie1 = Movie.create!(name: "foo", director: "bar")
    movie2 = Movie.new(name: "foo", director: "bar")
    assert movie1.valid?
    assert_not movie2.valid?
  end
end
