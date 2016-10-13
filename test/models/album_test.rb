require 'test_helper'

class AlbumTest < ActiveSupport::TestCase


  test "Create an Album with valid data" do
    album = Album.new(name: "foo")
    assert album.valid?
  end

  test "Should reject a movie with no name" do
    album = Album.new
    assert_not album.valid?
  end

  test "Create two albums with different names" do
    album1 = Album.create!(name: "Boo!")
    album2 = Album.new(name: "Moo!")
    assert album2.valid?
  end

  test "Should reject an album with a name that already exists" do
    album1 = Album.create!(name: "Boo!")
    album2 = Album.new(name: "Boo!")
    assert_not album2.valid?
  end
end
