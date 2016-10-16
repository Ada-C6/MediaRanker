require 'test_helper'

class TopAlbumTest < ActiveSupport::TestCase
  test "Create a album with a name and artist" do
    album = Album.new(name: "Black Holes", artist: "space")
    assert album.valid?
  end

  test "Cannot create a album with no title" do
    album = Album.new(artist: "space")
    assert_not album.valid?
  end

  test "Cannot create a album with no artist" do
    album = Album.new(name: "Black Holes")
    assert_not album.valid?
  end

  test "Album rank cannot be a float" do
    album = albums(:digitalism)
    album.rank = 5.5

    assert_not album.valid?
  end

  test "Album rank must be an integer" do
    album = albums(:digitalism)
    album.rank = 8

    assert album.valid?
  end

  test "Album rank cannot be negative" do
    album = albums(:digitalism)
    album.rank = -8

    assert_not album.valid?
  end
end
