require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "A book must have a title in order to be valid" do
    assert books(:one).valid?
    books(:one).title = nil
    assert_not books(:one).valid?
  end

  test "A book must have a author in order to be valid" do
    assert books(:one).valid?
    books(:one).author = nil
    assert_not books(:one).valid?
  end

  test "A book must have a description in order to be valid" do
    assert books(:one).valid?
    books(:one).description = nil
    assert_not books(:one).valid?
  end

  test "A book must have a unique combination of author and title in order to be valid" do
    assert books(:one).valid?
    books(:one).author = "Author2"
    assert books(:one).valid?
    books(:one).title = "Title2"
    assert_not books(:one).valid?

    assert books(:two).valid?
    books(:two).title = "Title3"
    assert books(:two).valid?
    books(:two).author = "Author3"
    assert_not books(:two).valid?
  end

  test "The top_ten method returns an upvote-ranked (descending) list of ten books" do
    assert_equal Book.top_ten.length, 10
    assert_equal Book.top_ten, [books(:twelve), books(:ten), books(:eleven), books(:nine), books(:eight), books(:seven), books(:six), books(:five), books(:four), books(:three)]
    assert_not Book.top_ten.include?(books(:one))
  end

  test "The all-ranked method returns an upvote-ranked (descending) list of all books" do
    assert_equal Book.all_ranked.length, 12
    assert_equal Book.all_ranked, [books(:twelve), books(:ten), books(:eleven), books(:nine), books(:eight), books(:seven), books(:six), books(:five), books(:four), books(:three), books(:two), books(:one)]
  end

end
