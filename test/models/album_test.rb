require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

  test "Can create an album with valid data" do
    album = Album.new(name: "Ten", artist: "Pearl Jam", description: "90s grunge")
    assert album.valid?
  end

  test "Cannot create two albums with the same title" do
    album1 = Album.create!(name: "Ten", artist: "Pearl Jam", description: "90s grunge")
    album2 = Album.new(name: "Ten", artist: "Pearl Jam", description: "90s grunge rock")
    assert_not album2.valid?
  end

  test "Can create two albums with different titles" do
    album1 = Album.create!(name: "Ten", artist: "Pearl Jam", description: "90s grunge")
    album2 = Album.new(name: "No Code", artist: "Pearl Jam", description: "90s grunge rock")
    assert album2.valid?
  end
  # test "the truth" do
  #   assert true
  # end
end
