require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

  test "validations: album name can't be blank" do
    album = albums(:Elton_one)
    assert_not album.valid?
    assert album.errors.keys.include?(:name), "name is not in the errors hash"
  end

  test "validations: album artist can't be blank" do
    album = albums(:Elton_two)
    assert_not album.valid?
    assert album.errors.keys.include?(:artist), "artist is not in the errors hash"
  end

  test "Create an album w/ valid data" do
    album = albums(:Robyn_one)
    assert album.valid?
  end

  test "Create two albums with different titles" do
    album1 = albums(:Britney_Spears_one)
    album2 = albums(:Britney_Spears_two)
    assert album2.valid?
  end

end
