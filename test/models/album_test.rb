require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'creator has correct number of albums' do
    assert_equal albums(:one).albums.size, 1
  end
end
