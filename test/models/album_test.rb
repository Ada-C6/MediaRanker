require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "Album cannot be created without a name" do
    album = Album.new
    assert_not album.valid?
  end
end
