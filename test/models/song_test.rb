require 'test_helper'

class SongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Songs must have a title, artist, genre and rank" do
    assert songs(:anywhere).valid? "Anywhere should be valid"

    songs(:anywhere).title = nil  ## This name removal is local to the test data - it doesn't change the fixture
    assert_not songs(:anywhere).valid? "Anywhere should no longer be valid"

    songs(:cool_girl).artist = nil
    assert_not songs(:cool_girl).valid? "Cool Girl should no longer be valid"
  end
end
