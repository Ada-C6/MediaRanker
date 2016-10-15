require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "Can create an album with unique name and artist" do
    album = Album.new(name: "Shiny Happy People Holding Hands", artist: "REM")
    assert album.valid?
    assert album.save
  end


  test "Cannot create an album with no name" do
    album = Album.new
    assert_not album.valid?
    assert_not album.save
    assert_includes album.errors, :name
  end

  test "Cannot create an album with a duplicate name" do
    orig_album = Album.create(name: "Sunburn")
    duplicate_album = Album.new(name: "Sunburn")
    assert_no_difference('Album.count') do
      assert_not duplicate_album.valid?
      assert_not duplicate_album.save
    end
  end

  test "Can create an album with no artist; default artist 'unknown artist'" do
    album = Album.new(name: "Let's Push Things Forward")
    assert album.valid?
    assert album.save
    assert_equal album.artist, "unknown artist"
  end

  test "Can create an album with a positive initial ranking value" do
    album = Album.new(name: "La La Latch", ranking: 10)
    assert album.valid?
    assert album.save
  end

  test "Cannot create an album with a negative ranking value" do
    album = Album.new(name: "Lake Woebegone", ranking: -10)
    assert_not album.valid?
    assert_not album.save
  end

  test "Album created without initial ranking value has ranking: 0" do
    album = Album.new(name: "Love Me Do")
    assert album.valid?
    assert album.save
    assert_equal album.ranking, 0
  end

  test "Update does not reset ranking" do
    album = albums(:album_9)
    initial_rank = album.ranking
    album.update(artist: "Not a Pokemon")
    assert_equal initial_rank, album.ranking
  end
end
