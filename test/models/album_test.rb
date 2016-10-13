require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

  test "albums with good date range are valid" do
    assert albums(:valid_data).valid?
  end
  test "albums with out a name are invalid" do
    assert_not albums(:missing_name).valid?
  end

#   test "Can't create album with out name" do
#    album = Album.new
#    assert_not album.valid?
#    assert album.errors.keys.include(:name), "Name"
#  end



end
