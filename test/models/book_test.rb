require 'test_helper'

class BookTest < ActiveSupport::TestCase

  test "Can create a book with all fields" do
    book = books(:Harry_Potter)

    assert book.valid?
  end

  test "Cannot create a book with missing name" do
    book = books(:Book_no_name)

    assert_not book.valid?
  end

  test "Cannot create a book with missing description" do
    book = books(:Book_no_desc)

    assert_not book.valid?
  end

  test "Cannot create a book with missing upvotes" do
    book = books(:Book_no_upvotes)

    assert_not book.valid?
  end

  test "Cannot create a book with negative upvotes" do
    book = books(:Book_negative_upvotes)

    assert_not book.valid?
  end

  test "Cannot create the same book twice" do
    book = books(:Harry_Potter)
    book1 = Book.new(name: 'Harry Potter and the Goblet of Fire', author: 'JK Rowling', description: 'Magic and partonuses!', upvotes: 0)

    assert book.valid?
    assert_not book1.valid?
  end

  test "Can rename a book" do
    book = books(:Rename_book)
    book.name = "Batman"

    assert book.valid?
  end

  test "Cannot rename a book to duplicate an existing book" do
    book = books(:Named_book)

    book1 = books(:Cant_rename_book)
    book1.name = "Batman"

    assert book.valid?
    assert_not book1.valid?
  end

  test "The method upvote will increase the Book's upvotes by 1" do
    book = books(:Harry_Potter)
    upvotes = book.upvotes
    assert_equal(upvotes, 0)

    book.upvote
    upvotes = book.upvotes
    assert_equal(upvotes, 1)
  end

end
