require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Create an empty Album" do
    album = Album.new
    assert album.valid?
  end
end
