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

  test "When a new album is created, rank is 0" do
    album = albums(:Phil_Collins_one)
    assert album.rank == 0
  end

  test "When a new album is created, rank isn't something besides 0" do
    album = albums(:Smashing_Pumpkins_one)
    assert_not album.rank == rand(1..2000)
    assert_not album.rank == rand(-2000..-1)
  end

end
