require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "an album must have a title, description and recorded_by" do
    assert albums(:suburbs).valid?
    albums(:suburbs).title = nil
    assert_not albums(:suburbs).valid?
    albums(:suburbs).description = nil
    assert_not albums(:suburbs).valid?
    albums(:suburbs).recorded_by = nil
    assert_not albums(:suburbs).valid?
  end

  test 'an album must have a unique title' do
    suburbs = albums(:suburbs)
    album = Album.new(:title => suburbs.title)
    album.valid?
    assert_includes(album.errors[:title], "has already been taken")
  end

end
