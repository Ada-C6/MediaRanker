require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "Book must have a name" do
    assert_not books("without_a_name").valid?
  end

  test "Book must have some sort of rank point value" do
    assert_not books("without_rank_points").valid?
  end

  test "Book must have an author" do
    assert_not books("without_an_author").valid?
  end

  test "Book can have negative points" do
    book = books("correct_book")
    book.rank_points -= 2
    assert_equal(-1, book.rank_points)
    assert book.valid?
  end
end
