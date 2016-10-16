require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "A valid entry will save" do
    album = albums(:valid_album)

    assert album.save
    assert album.valid?
  end

  test "validations: album artist can't be blank" do
    album = Album.new(title: "New Album")

    assert_not album.save
    assert_not album.valid?
    assert album.errors.keys.include?(:artist), "artist is not in the errors hash"
  end

  test "validations: album title can't be blank" do
    album = Album.new(artist: "Allison")

    assert_not album.save
    assert_not album.valid?
    assert album.errors.keys.include?(:title), "title is not in the errors hash"
  end

  test "validations: album title must be unique" do
    album = albums(:valid_album)
    assert album.save

    album2 = Album.new(title: "Valid Album", artist: "Allison")
    assert_not album2.save
    assert_not album2.valid?
    assert album2.errors.keys.include?(:title), "title is not in the errors hash"
  end

  test "#upvote: should increase the rank value by 1" do
    album = albums(:valid_album)

    assert album.save
    assert album.upvote
    assert album.save
    assert_equal album.rank, 1, "Rank value did not increase by 1"
  end

  test "self.order_descending should order the albums highest to lowest" do
    ordered = Album.order_descending

    assert_equal "Jazz", ordered[0].title
    assert_equal "Classical", ordered[1].title
    assert_equal "Valid Album", ordered.last.title
  end

  test "self.top_ten should return only 10 highest albums in order" do
    top = Album.top_ten

    assert_equal 10, top.length
    assert_equal "Jazz", top[0].title
    assert_equal "R&B", top.last.title
  end
end
