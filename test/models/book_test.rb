require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "Can create a book with valid data" do
    book = Book.new(name: "Atlas Shrugged", author: "Ayn Rand", description: "Libertarian snobbery")
    assert book.valid?
  end

  test "Cannot create two books with the same title and author" do
    book1 = Book.create!(name: "Atlas Shrugged", author: "Ayn Rand", description: "Libertarian snobbery")
    book2 = Book.new(name: "Atlas Shrugged", author: "Ayn Rand", description: "Libertarian awesomeness")
    assert_not book2.valid?
    assert_includes book2.errors, :name
  end

  test "Can create two books with different titles" do
    book1 = Book.create!(name: "Atlas Shrugged", author: "Ayn Rand", description: "Libertarian snobbery")
    book2 = Book.new(name: "The Fountainhead", author: "Ayn Rand", description: "Libertarian awesomeness")
    assert book2.valid?
  end

  test "Cannot create a book with missing information" do
    book = Book.new
    assert_not book.valid?
    assert_includes book.errors, :name
    assert_includes book.errors, :author
    assert_includes book.errors, :description
  end
end
