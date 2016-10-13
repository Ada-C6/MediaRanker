require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "Album cannot be created without a name" do
    album = Album.new
    assert_not album.valid?
  end

  test "Albums cannot share the same name" do
    album1 = Album.create(name: "Fuck Marry Kill")
    album2 = Album.new(name: "Fuck Marry Kill")
    assert_not album2.valid?
  end


end
