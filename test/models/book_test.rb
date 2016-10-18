require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Create a book with valid data" do
    book = Book.new(name: "foo", author: "bar")
    assert book.valid?
  end

  test "Create two books with different names" do
    book_one = Book.create!(name: "Half of a Yellow Sun", author: "Chimamanda Ngozi Adichie")
    book_two = Book.create!(name: "Sister Outsider", author: "Audre Lorde")
    assert book_two.valid?
  end

  test "Cannot create two books with the same name" do
    assert books(:the_prophet).valid?
    book_two = Book.new(name: "The Prophet", author: "Kahlil Gibran")
    assert_not book_two.valid?
  end

  test "Cannot create a book with no name" do
    book = Book.new(author: "bar")
    assert_not book.valid?
  end

  test "Cannot create a book with no author" do
    book = Book.new(name: "foo")
    assert_not book.valid?
  end
end
