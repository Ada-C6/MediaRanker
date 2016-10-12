require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

    test "Create a album with all data" do
    album = Album.new(name: "Shatter Me", artist: "Lindsey Stirling", description: "Awesome")
    assert album.valid?
  end

    test "Create a album with just all required data" do
    album = Album.new(name: "Shatter Me")
    assert album.valid?
  end

  test "Cannot create a album with only unrequired data" do
    album = Album.new(artist: "Lindsey Stirling", description: "Awesome")
    assert_not album.valid?
  end

  test "Activating upvote method adds 1 to the album.ranking" do
      album = albums(:black_celebration)
      album.upvote
      assert_equal album.ranking, 1
  end
end
