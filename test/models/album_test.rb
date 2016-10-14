require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "Create an album with valid data" do
    album = Album.new(name: "Let's Talk About Love", artist: "Celine Dion", ranked: 0)
    assert album.valid?
  end

  test "Create an album with no name" do
    album = Album.new(artist: "Kelly", ranked: 0)
    assert_not album.save
    assert_includes album.errors, :name
  end

  test "Create two albums with the same name" do
    album1 = albums(:red)
    album2 = Album.create(name: "Red", artist: "Kelly", ranked: 0)
    assert_not album2.valid?
  end

  test "Create an album with no artist" do
    album = Album.new(name: "Kelly", ranked: 0)
    assert_not album.save
    assert_includes album.errors, :artist
  end

  test "Create an album with no ranking" do
    album = Album.new(name: "Hello", artist: "Kelly")
    assert_not album.save
    assert_includes album.errors, :ranked
  end

  test "Create an album with non-numerical ranking" do
    album = Album.new(name: "Hello", artist: "Kelly", ranked: "something")
    assert_not album.save
    assert_includes album.errors, :ranked
  end

  test "Album cannot have negative ranking" do
    album = Album.new(name: "Hello", artist: "Kelly", ranked: -3)
    assert_not album.save
    assert_includes album.errors, :ranked
  end

  test "Album can have zero ranking" do
    album = Album.new(name: "Hello", artist: "Kelly", ranked: 0)
    assert album.save
    assert_equal album.ranked, 0
  end

  test "Albums's rankings are calculated correctly from upvote" do
    current_rank = albums(:miracle).ranked
    new_rank = current_rank + 1
    assert_equal albums(:miracle).upvote, new_rank
  end

  test "Album without a ranking should return nil from upvote" do
    assert_equal albums(:no_rank).upvote, nil
  end
end
