require "test_helper"

class AlbumTest < ActiveSupport::TestCase

  test "Create an album with valid data" do
    album = albums(:one)
    assert album.valid?
  end

  test "Cannot create an unnamed album" do
    album = Album.new
    assert_not album.valid?
    assert_includes album.errors, :title

  end

  test "Cannot create two albums with different names" do
    album1 = albums(:one)
    album2 = Album.new(title: "Violin")

    assert_not album2.valid?
  end

  test "Vote attribute must be zero or a positive integer" do
    album1 = Album.new(title: "Test", vote: -1)
    album2 = albums(:two)
    album3 = albums(:three)

    assert_not album1.valid?
    assert_not album1.save

    assert album2.valid?
    assert album3.valid?
  end

  test "Increases vote by one when upvote is called" do
    album = albums(:two)
    assert_equal album.upvote, 14
    assert_not_equal album.upvote, 14

  end

end
