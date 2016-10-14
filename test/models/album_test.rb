require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

  test "Can create an album with all fields" do
    album = albums(:Harry_and_the_Potters)

    assert album.valid?
  end

  test "Cannot create an album with missing name" do
    album = albums(:Album_no_name)

    assert_not album.valid?
  end

  test "Cannot create an album with missing description" do
    album = albums(:Album_no_desc)

    assert_not album.valid?
  end

  test "Cannot create an album with missing upvotes" do
    album = albums(:Album_no_upvotes)

    assert_not album.valid?
  end

  test "Cannot create an album with negative upvotes" do
    album = albums(:Album_negative_upvotes)

    assert_not album.valid?
  end

  test "Cannot create the same album twice" do
    album = albums(:Harry_and_the_Potters)
    album1 = Album.new(name: 'Harry and the Potters', artist: 'Harry and the Potters', description: 'Harry and the Potters is the eponymous debut studio album by indie rock band Harry and the Potters, released in June 2003.', upvotes: 0)

    assert album.valid?
    assert_not album1.valid?
  end

  test "Can rename an album" do
    album = albums(:Rename_album)
    album.name = "The Doors"

    assert album.valid?
  end

  test "Cannot rename an album to duplicate an existing album" do
    album = albums(:Named_album)

    album1 = albums(:Cant_rename_album)
    album1.name = "The Doors"

    assert album.valid?
    assert_not album1.valid?
  end


end
