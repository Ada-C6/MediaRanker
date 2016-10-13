require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

  test "Can create an album with all fields" do
    album = Album.new(name: 'Harry and the Potters', artist: 'Harry and the Potters', description: 'Harry and the Potters is the eponymous debut studio album by indie rock band Harry and the Potters, released in June 2003.', upvotes: 0)
    assert album.valid?
  end

  test "Cannot create an album with missing fields" do
    album = Album.new(name: 'Harry and the Potters', artist: 'Harry and the Potters', upvotes: 0)
    assert_not album.valid?
  end

  test "An album cannot have nil upvotes" do
    album = Album.new(name: 'Harry and the Potters', artist: 'Harry and the Potters', description: 'Harry and the Potters is the eponymous debut studio album by indie rock band Harry and the Potters, released in June 2003.')
    assert_not album.valid?
  end


end
