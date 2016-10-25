require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # validates :artist, presence: true
  # validates :name, presence: true

  test 'album with no name is invalid' do
    assert albums(:one).valid?
    albums(:one).name = nil
    assert_not albums(:one).valid?
  end

  test 'album with no artist is invalid' do
    assert albums(:one).valid?
    albums(:one).artist = nil
    assert_not albums(:one).valid?
  end

  test 'an album must have a unique name' do
   album = Album.new(album: {name: one})
   album.valid?
   assert_includes(album.errors[:name], "has already been taken")
 end



end
