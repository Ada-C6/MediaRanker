require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "validations: album title can't be blank" do
    album = albums(:girl_on_fire)

    assert_not album.valid?
  end

  test "validations: albums with a title are valid" do
    album = albums(:glee_6)

    assert album.valid?
  end

  test "validations: album artist can't be blank" do
    album = albums(:brittany_2)

    assert_not album.valid?
  end

  test "validations: album with artist are valid" do
    album = albums(:the_way)

    assert album.valid?
  end


end
