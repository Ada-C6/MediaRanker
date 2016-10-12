require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "Can create a book with valid data" do
    book = Book.new(name: "Atlas Shrugged", author: "Ayn Rand", description: "Libertarian snobbery")
    assert book.valid?
  end

  test "Cannot create two books with the same title" do
    book1 = Book.create!(name: "Atlas Shrugged", author: "Ayn Rand", description: "Libertarian snobbery")
    book2 = Book.new(name: "Atlas Shrugged", author: "Ayn Rand", description: "Libertarian awesomeness")
    assert_not book2.valid?
  end

  test "Can create two books with different titles" do
    book1 = Book.create!(name: "Atlas Shrugged", author: "Ayn Rand", description: "Libertarian snobbery")
    book2 = Book.new(name: "The Fountainhead", author: "Ayn Rand", description: "Libertarian awesomeness")
    assert book2.valid?
  end
  # test "the truth" do
  #   assert true
  # end
end
