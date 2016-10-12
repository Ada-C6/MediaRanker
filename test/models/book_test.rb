require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "Activating upvote method adds 1 to the book.ranking" do
      book = books(:harry_potter)
      book.upvote
      assert_equal book.ranking, 1
  end
end
