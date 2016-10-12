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
end
