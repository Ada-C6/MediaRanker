require 'test_helper'

class SeinfeldTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Seinfeld Episodes must have a title, season, episode and rank" do
    assert seinfelds(:peephole).valid? "The Reverse Peephole should be valid"

    seinfelds(:peephole).title = nil  ## This name removal is local to the test data - it doesn't change the fixture
    assert_not seinfelds(:peephole).valid? "The Reverse Peephole should no longer be valid"

    seinfelds(:slicer).episode = nil
    assert_not seinfelds(:slicer).valid? "The Slicer should no longer be valid"
  end

  test "Seinfeld Episodes must have a unique title" do
    assert_not Seinfeld.new(title: "The Slicer", season: 8, episode: 7, description: "Kramer gets into meat slicing; Jerry dates a doctor (Marcia Cross) who isn't impressed with his job; George's new boss is a former adversary.", rank: 54).valid? "A Seinfeld Episode with same title and should not be valid"
  end

  test 'Episodes can be upvotes or downvote on' do
    seinfelds(:peephole).upvote
    assert_equal seinfelds(:peephole).rank, 64

    seinfelds(:peephole).downvote
    assert_equal seinfelds(:peephole).rank, 63
  end
end
