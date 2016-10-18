require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "create an album with no name" do
    album = Album.new
    assert_not album.valid?
  end
end
