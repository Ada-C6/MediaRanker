require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "validations: movies without titles are not valid" do
    movie = movies(:godfather)

    assert_not movie.valid?
  end

  test "validations: movies with titles are valid" do
    movie = movies(:sound_of_music)

    assert movie.valid?
  end

  test "validations: movies without a director are not valid" do
    movie = movies(:kill_a_mockingbird)

    assert_not movie.valid?
  end

  test "validations: movies with a director are valid" do
    movie = movies(:jaws)

    assert movie.valid?
  end
end
