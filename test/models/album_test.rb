require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

  test "Create an album with valid data" do
    album = Album.new(name: "foo", artist: "bar", description: "test", ranking: 0)

    assert album.valid?
  end

  test "Album name can't be blank" do
    album = Album.new(artist: "bar", description: "test", ranking: 0)

    assert_not album.valid?
  end

  test "Album artist can't be blank" do
    album = Album.new(name: "foo", artist: nil, description: "test", ranking: 0)

    assert_not album.valid?
  end

  test "Album description can't be blank" do
    album = Album.new(name: "foo", artist: "test", description: nil, ranking: 0)

    assert_not album.valid?
  end

  test "Cannot create an album with a nil or non-integer ranking value" do
    album = Album.new(name: "12", artist: "bar", description: "test", ranking: nil)
    album2 = Album.new(name: "12", artist: "bar", description: "test", ranking: 2.3)

    assert_not album.valid?
    assert_not album2.valid?
  end

  test "Cannot create two albums with the same title" do
    album1 = albums(:gatos)
    album2 = Album.new(name: "Gatos", artist: "meow_meow", description: "los gatos hace meow", ranking: 12)

    assert_not(album2.valid?)
  end


end
