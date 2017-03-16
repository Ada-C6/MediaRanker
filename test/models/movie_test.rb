require 'test_helper'

class MovieTest < ActiveSupport::TestCase

  test "the truth" do
    assert true
  end

  test "An movie must have a name" do
    assert movies(:mulan).valid?
    movies(:mulan).name = nil
    assert_not movies(:mulan).valid?
  end

  test "upvote should raise rank count" do
    assert_difference("movies(:mulan).rank", 1) do
      movies(:mulan).upvote
    end
  end

end
