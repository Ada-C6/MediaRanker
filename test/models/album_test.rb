require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "An album must have a name" do
    assert albums(:X).valid?
    albums(:X).name = nil
    assert_not albums(:X).valid?
  end

  test "upvote should raise rank count" do
    assert_difference("albums(:X).rank", 1) do
      albums(:X).upvote
    end
  end

end
