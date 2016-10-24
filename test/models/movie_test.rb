require 'test_helper'

class TopMovieTest < ActiveSupport::TestCase
  test "Create a movie with a name" do
    movie = Movie.new(name: "Black Holes")
    assert movie.valid?
  end

  test "Cannot create a movie with no title" do
    movie = Movie.new
    assert_not movie.valid?
  end

  test "Movie description can be nil" do
    movie = movies(:glue_sticks)
    movie.description = nil

    assert movie.valid?
  end

  test "Movie description can't be > 150 characters" do
    movie = movies(:glue_sticks)
    movie.description = "One option is to write a very short story that demonstrates some key attributes.  Possibly, describe something you have done that embodies your unique traits.  A good story will leave the reader with a question, and it should be a question you want them to ask and are prepared to answer."

    assert_not movie.valid?
  end

  test "Movie description must be <= 150 characters" do
    movie = movies(:glue_sticks)
    movie.description = "One option is to write a very short story that demonstrates some key attributes.  Possibly, describe something you have done that embodies your uniqu."

    assert movie.valid?
  end

  test "Movie rank cannot be a float" do
    movie = movies(:glue_sticks)
    movie.rank = 5.5

    assert_not movie.valid?
  end

  test "Movie rank must be an integer" do
    movie = movies(:glue_sticks)
    movie.rank = 8

    assert movie.valid?
  end

  test "Movie rank cannot be negative" do
    movie = movies(:glue_sticks)
    movie.rank = -8

    assert_not movie.valid?
  end
end
