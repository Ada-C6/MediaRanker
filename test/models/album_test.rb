require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

  test "An album must have a name, an artist, and a description" do
    fake_album = Album.new
    assert fake_album.invalid? "A book must have a name, an author, and a description"

    fake_album_name = Album.new ({name: "Mmmbop", artist: nil, description: nil, votes: 0})
    assert fake_album_name.invalid? "An album must have a name, an author, and a description"

    fake_album_name_artist = Album.new ({name: "Mmmbop", artist: "Hanson", description: nil, votes: 0})
    assert fake_album_name_artist.invalid? "An album must have a name, an artist, and a description"

    fake_album_name_artist_description = Album.new ({name: "Mmmbop", artist: "Hanson", description: "Mmmbop will be stuck in your head for the entire 90s - sorry.", votes: 0})
    assert fake_album_name_artist_description.valid?
  end

  test "An album's votes attirbute must be a number." do
    fake_album_nonnum_vote= Album.new ({name: "Mmmbop", artist: "Hanson", description: "Mmmbop will be stuck in your head for the entire 90s - sorry.", votes: "beef"})
    assert fake_album_nonnum_vote.invalid?
  end

  test "Correctly retrieves the attributes of an album" do
    assert_equal albums(:spiceworld).name, "SpiceWorld"
    assert_equal albums(:spiceworld).artist, "Spice Girls"
    assert_equal albums(:spiceworld).description, "'90s British pop sensation'"
    assert_equal albums(:spiceworld).votes, 10
  end
end
