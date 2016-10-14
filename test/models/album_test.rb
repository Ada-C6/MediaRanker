require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "Album must have a name" do
    assert_not albums("without_a_name").valid?
  end

  test "Album must have some sort of rank point value" do
    assert_not albums("without_rank_points").valid?
  end

  test "Album must have an artist" do
    assert_not albums("without_an_artist").valid?
  end

  test "Album can have negative points" do
    album = albums("correct_album")
    album.rank_points -= 2
    assert_equal(-1, album.rank_points)
    assert album.valid?
  end

end
