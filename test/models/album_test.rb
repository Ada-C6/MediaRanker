require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "An Album must be valid" do
    assert albums(:one).valid?,  "an Album must have a name"
    assert albums(:three).valid?,  "an Album must have a name"

    albums(:one).name = nil   # This only happens in this test
    assert_not albums(:one).valid?  # this is based on validations in : app/models/album.rb
  end

  test "An Album must have a name" do
    item = Album.new

    assert_not item.valid?, "An Item without a name is invalid."
    item.name = "Gardens"
    assert item.valid?, "More than just a name must be required..."
  end

  test "Album 1 has the correct title " do
    assert_equal albums(:one).name,  "album1",  "The Album must have the correct"
  end


end
