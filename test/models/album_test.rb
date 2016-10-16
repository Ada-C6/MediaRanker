require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "Album cannot be created without a title or artist" do
    album = Album.new(description: "Why is there no title or artist")
    assert_not album.save
    assert_includes album.errors, :title && :by
  end

  test "Initial ranked should be 0" do
    album = Album.new(title: "C", by: "Alicia Keys")
    assert_equal album.ranked, 0
  end

  test "Album has title, by, ranked and description attributes" do
    assert_includes albums(:juanes).attributes, (:title && :by && :ranked && "description")
  end

  test "Upvote will add one to the ranked attribute" do
    expected = albums(:juanes).ranked + 1
    albums(:juanes).upvote
    assert_equal albums(:juanes).ranked, expected
  end

  test "Album.by_rank should return all albums in order of highest ranked" do
    albums = Album.by_rank
    assert albums.first.ranked > albums.last.ranked
  end

  test "Album.top_ten should return up to 10 of the highest ranked albums" do
    albums = Album.by_rank.take(10)
    top_ten = Album.top_ten
    assert_equal albums, top_ten
  end
end
