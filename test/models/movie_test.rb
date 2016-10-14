require 'test_helper'

class MovieTest < ActiveSupport::TestCase

  ############test on Validations#############

  # ================================
  # Test set 1: An movie must have a name AND a director to be valid

  # Positive case
  test "An movie is valid when it has a name AND a director" do
    movie = Movie.new
    assert_not movie.valid?
    movie.name = "n1"
    movie.director = "d1"

    assert movie.valid?
  end

  # Negative case
  test "An movie is invalid without a name" do
    assert media(:movie1).valid?
    media(:movie1).name = nil
    assert_not media(:movie1).valid?
  end

  # Edge Case
  test "An movie is invalid when it has a NAME but does not has a DIRECTOR" do
    movie = Movie.new
    assert_not movie.valid?
    movie.name = "n1"
    assert_not movie.valid?
  end

  # Edge Case
  test "An movie is invalid when it has a DIRECTOR but does not has a NAME" do
    movie = Movie.new
    assert_not movie.valid?
    movie.director = "d1"
    assert_not movie.valid?
  end

  # ================================
  # Test set 2: Attributes are linked to the model

  test "movie1 was by director1" do
    assert_equal media(:movie1).director, "director1"
  end


end
