require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "create a book with no name" do
    book = Book.new
    assert_not book.valid?
  end

  test "orders  books by most votes" do
    popular = Book.most_votes
    assert_equal  popular.first, books(:bridget_jones_diary)
  end
end
