require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "An movie must have a rank greater than or equal to zero" do
    movies(:one).rank = nil
    assert_not movies(:one).valid?
  end

  test "An movie must have a title" do
    assert_equal movies(:one).title, "Movie1"
    movies(:one).title = nil
    assert_not movies(:one).valid?
  end

  test "An movie must have an director" do
    assert_equal movies(:two).director, "Director2"
    movies(:one).director = nil
    assert_not movies(:one).valid?
  end

  test "An movie can have a description but doesn't have to" do
    assert_equal movies(:two).description, "A great second movie!"
    movies(:two).description = nil
    assert movies(:one).valid?
  end
end
