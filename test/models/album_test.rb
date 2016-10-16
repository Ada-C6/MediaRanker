require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "Create an album with valid data" do
    album = Album.new(name: "Let's Talk About Love", artist: "Celine Dion", ranked: 0)
    assert album.valid?
  end

  test "Album will have relevant data fields" do
    album = albums(:miracle)
    assert_equal album.name, "Miracle"
    assert_equal album.artist, "Celine Dion"
    assert_equal album.description, "a concept album credited to Canadian singer Celine Dion and Australian photographer Anne Geddes"
  end

  test "Album without relevant data fields will return nil values" do
    album = albums(:no_rank)
    assert_nil album.artist
    assert_nil album.description
    assert_nil album.ranked
  end

  test "Cannot create an album with no name" do
    album = Album.new(artist: "Kelly", ranked: 0)
    assert_not album.save
    assert_includes album.errors, :name
  end

  test "Cannot create two albums with the same name" do
    album1 = albums(:red)
    album2 = Album.create(name: "Red", artist: "Kelly", ranked: 0)
    assert_not album2.valid?
  end

  test "Cannot create an album with no artist" do
    album = Album.new(name: "Kelly", ranked: 0)
    assert_not album.save
    assert_includes album.errors, :artist
  end

  test "Create an album with no ranking" do
    album = Album.new(name: "Hello", artist: "Kelly")
    assert album.save
    assert album.valid?
  end

  test "Cannot create an album with non-numerical ranking" do
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

  test "Albums' rankings are calculated correctly from upvote" do
    current_rank = albums(:miracle).ranked
    new_rank = current_rank + 1
    assert_equal albums(:miracle).upvote, new_rank
  end

  test "Album without a ranking should return 1 from upvote" do
    assert_equal albums(:no_rank).upvote, 1
  end
end
