require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Create an album" do
    album = Album.new(name: "foo", artist: "bar")
    assert album.valid?
  end

  test "Cannot create an album with no title" do
    album = Album.new(artist: "bar")
    assert_not album.valid?
  end

  test "Cannot create an album with no artist" do
    album = Album.new(name: "foo")
    assert_not album.valid?
  end
end
