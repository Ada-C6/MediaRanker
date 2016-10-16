require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "Create an album w/ valid data" do
    assert albums(:a_hard_days_night).valid?
  end

  test "Create an album with no name" do
    album = Album.new
    assert_not album.valid?
  end

  test "Create an album with the same name as another" do
    album1 = Album.create!(name: "foo", artist: "hi")
    album2 = Album.new(name: "foo")
    assert album2.valid?
  end

  test "Create an album with the same name and artist as another" do
    album1 = Album.create!(name: "foo", artist: "bar")
    album2 = Album.new(name: "foo", artist: "bar")
    assert_not album2.valid?
  end
end
