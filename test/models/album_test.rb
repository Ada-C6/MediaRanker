require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "Activating upvote method adds 1 to the album.ranking" do
      album = albums(:black_celebration)
      album.upvote
      assert_equal album.ranking, 1
  end
end
