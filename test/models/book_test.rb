require 'test_helper'

class BookTest < ActiveSupport::TestCase

  test "Book name cannot be empty" do
    book = Book.new
    assert_not book.valid?
  end

  test "Can create a book with a title" do
    book = Book.create!(name: "The End of Shari")
    assert book.valid?
  end

  test "Books must have unique titles" do
    book1 = Book.create!(name: "Tropical Books")
    book2 = Book.new(name: "Tropical Books")
    assert_not book2.valid?
  end
end
