require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "Cannot create a book without a title" do
    book = Book.new
    assert_not book.valid?
    assert_includes book.errors, :title

  end

  test "Create a book with a title" do
    books.each do |book|
      assert_not_nil book.title
      assert book.valid?
    end
  end

  test "Cannot create a book without an author" do
    book = Book.new
    assert_not book.valid?
    assert_includes book.errors, :author
  end

  test "Create a book with an author" do
    books.each do |book|
      assert_not_nil book.author
      assert book.valid?
    end
  end

  test "Book.sort_by_rank returns a list of books sorted by rank in descending order" do
    assert_equal Book.sort_by_rank.first, books(:lotr)
  end

  test "Book.sort_by_rank places items with nil :rank at the bottom" do
    assert_equal Book.sort_by_rank.last, books(:nil_rank)
  end

  test "Book.sort_by_rank returns all items in database" do
    assert_equal Book.sort_by_rank.count, 4
  end
end
