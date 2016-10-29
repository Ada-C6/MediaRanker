require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  
 test "validations: album name can't be blank" do 
    album = Album.new

    assert_not album.valid?
    assert album.errors.keys.include?(:name), "name is not present"
  end

  test 'should not save album witout name' do

    album = Album.new
    assert_not album.save, "Cannot savem moive without a name"
  end

end
