require 'test_helper'

class TopBookTest < ActiveSupport::TestCase
  test "Create a book with a name and author" do
    book = Book.new(name: "Black Holes", author: "deep space")
    assert book.valid?
  end

  test "Cannot create a book with no title" do
    book = Book.new(author: "deep space")
    assert_not book.valid?
  end

  test "Cannot create a book with no author" do
    book = Book.new(name: "Black Holes")
    assert_not book.valid?
  end

  test "Book description can be nil" do
    book = books(:h_potter)
    book.description = nil

    assert book.valid?
  end

  test "Book description can't be > 150 characters" do
    book = books(:h_potter)
    book.description = "One option is to write a very short story that demonstrates some key attributes.  Possibly, describe something you have done that embodies your unique traits.  A good story will leave the reader with a question, and it should be a question you want them to ask and are prepared to answer."

    assert_not book.valid?
  end

  test "Book description must be <= 150 characters" do
    book = books(:h_potter)
    book.description = "One option is to write a very short story that demonstrates some key attributes.  Possibly, describe something you have done that embodies your uniqu."

    assert book.valid?
  end

  test "Book rank cannot be a float" do
    book = books(:h_potter)
    book.rank = 5.5

    assert_not book.valid?
  end

  test "Book rank must be an integer" do
    book = books(:h_potter)
    book.rank = 8

    assert book.valid?
  end

  test "Book rank cannot be negative" do
    book = books(:h_potter)
    book.rank = -8

    assert_not book.valid?
  end
end
