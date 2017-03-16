require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "An book must have a name" do
    assert books(:corduroy).valid?
    books(:corduroy).name = nil
    assert_not books(:corduroy).valid?
  end

  test "upvote should raise rank count" do
    assert_difference("books(:corduroy).rank", 1) do
      books(:corduroy).upvote
    end
  end

end
