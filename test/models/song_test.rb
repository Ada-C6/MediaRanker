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

  test "Songs must have a unique combination of title and author" do
    assert songs(:anywhere_title).valid? "Anywhere with same title and different author should be valid"

    assert_not Song.new(title: "Anywhere", artist: "Dillon Francis", album: "Anywhere", genre: "Dance", rank: 15).valid? "Anywhere with same title and same artist should not be valid"
  end

  test 'Books can be upvotes or downvote on' do
    songs(:cool_girl).upvote
    assert_equal songs(:cool_girl).rank, 31

    songs(:cool_girl).downvote
    assert_equal songs(:cool_girl).rank, 30
  end
end
