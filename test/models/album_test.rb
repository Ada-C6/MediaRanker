require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "An album must have a rank greater than or equal to zero" do
    albums(:one).rank = nil
    assert_not albums(:one).valid?
  end

  test "An album must have a title" do
    assert_equal albums(:one).title, "Album1"
    albums(:one).title = nil
    assert_not albums(:one).valid?
  end

  test "An album must have an artist" do
    assert_equal albums(:two).artist, "Artist2"
    albums(:one).artist = nil
    assert_not albums(:one).valid?
  end

  test "An album can have a description but doesn't have to" do
    assert_equal albums(:two).description, "A great second album!"
    albums(:two).description = nil
    assert albums(:one).valid?
  end
  
end
