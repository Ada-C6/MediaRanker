require 'test_helper'

class BookTest < ActiveSupport::TestCase

  test "Create a Book with valid data" do
    book = Book.new(title: "foo")
    assert book.valid?
  end

  test "Should reject a book with no title" do
    book = Book.new
    assert_not book.valid?
  end

  test "Create two albums with different titles" do
    book1 = Book.create!(title: "Boo!")
    book2 = Book.new(title: "Moo!")
    assert book2.valid?
  end

  test "Should reject an book with a title that already exists" do
    book1 = Book.create!(title: "Boo!")
    book2 = Book.new(title: "Boo!")
    assert_not book2.valid?
  end
end
