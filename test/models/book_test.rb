require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Books must have a title, author, genre and rank" do
    assert books(:red_fern).valid? "Red Fern Grows should be valid"

    books(:red_fern).title = nil  ## This name removal is local to the test data - it doesn't change the fixture
    assert_not books(:red_fern).valid? "Red Fern Grows should no longer be valid"

    books(:dingo).rank = nil
    assert_not books(:dingo).valid? "Dingo should no longer be valid"
  end


  test "Books must have a unique combination of title and author" do
    assert books(:red_fern_title).valid? "Red Fern with same title and different author should be valid"

    assert_not Book.new(title: "Where the Red Fern Grows", author: "Wilson Rawls", genre: "Children", description: "About a boy who buys and trains two Redbone Coonhound hunting dogs", rank: 10).valid? "Red Fern with same title and same author should not be valid"
  end
end
