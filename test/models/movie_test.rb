require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "a movie must have a name, description and directed_by" do
    assert movies(:inception).valid?
    movies(:inception).name = nil
    assert_not movies(:inception).valid?
    movies(:inception).description = nil
    assert_not movies(:inception).valid?
    movies(:inception).directed_by = nil
    assert_not movies(:inception).valid?
  end

  test 'a movie must have a unique name' do
    inception = movies(:inception)
    movie = Movie.new(:name => inception.name)
    movie.valid?
    assert_includes(movie.errors[:name], "has already been taken")
  end
end
