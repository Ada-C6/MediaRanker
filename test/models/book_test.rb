require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "Book cannot be created without a title or author" do
    book = Book.new(description: "Why is there no title or author")
    assert_not book.save
    assert_includes book.errors, :title && :by
  end

  test "Initial ranked should be 0" do
    book = Book.new(title: "Iliad", by: "Homer")
    assert_equal book.ranked, 0
  end

  test "Book has title, by, ranked and description attributes" do
    assert_includes books(:matilda).attributes, (:title && :by && :ranked && "description")
  end

  test "Upvote will add one to the ranked attribute" do
    expected = books(:matilda).ranked + 1
    books(:matilda).upvote
    assert_equal books(:matilda).ranked, expected
  end

  test "Book.by_rank should return all books in order of highest ranked" do
    books = Book.by_rank
    assert books.first.ranked > books.last.ranked
  end

end
