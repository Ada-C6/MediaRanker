require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "Album must have a name" do
    album = albums("without_a_name")
    album.name = nil

    assert_not album.valid?
  end

  test "Album must have some sort of rank point value" do
    album = albums("without_rank_points")
    album.rank_points = nil

    assert_not album.valid?
  end

  test "Album must have an author" do
    album = albums("without_an_artist")
    album.artist = nil

    assert_not album.valid?
  end

  test "Album can have negative points" do
    album = albums("correct_album")
    album.rank_points -= 100

    assert_operator album.rank_points, :<, 0
    assert album.valid?
  end

end
