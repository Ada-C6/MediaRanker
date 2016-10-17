require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "Create a book with valid data" do
    book = Book.new(name: "foo", author: "bar", description: "test", ranking: 0)

    assert book.valid?
  end

  test "Book name can't be blank" do
    book = Book.new(author: "bar", description: "test", ranking: 0)

    assert_not book.valid?
  end

  test "Book author can't be blank" do
    book = Book.new(name: "foo", author: nil, description: "test", ranking: 0)

    assert_not book.valid?
  end

  test "Book description can't be blank" do
    book = Book.new(name: "foo", author: "test", description: nil, ranking: 0)

    assert_not book.valid?
  end

  test "Cannot create a book with a nil or non-integer ranking value" do
    book = Book.new(name: "12", author: "bar", description: "test", ranking: nil)
    book2 = Book.new(name: "12", author: "bar", description: "test", ranking: 2.3)

    assert_not book.valid?
    assert_not book2.valid?
  end

  test "Cannot create two books with the same title" do
    book1 = books(:libro_de_gatos)
    book2 = Book.new(name: "Libro de Gatos", author: "meow_meow", description: "los gatos hace meow", ranking: 12)

    assert_not(book2.valid?)
  end
end
