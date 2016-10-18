require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "create an album with no name" do
    album = Album.new
    assert_not album.valid?
  end

  test "orders albums by most votes" do
    popular = Album.most_votes
    assert_equal  popular.first, albums(:tragic_kingdom)
  end
end
