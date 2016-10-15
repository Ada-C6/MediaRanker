require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "Can create a book with unique name and author" do
    book = Book.new(name: "The Phantom Tollbooth", author: "Norton Juster")
    assert book.valid?
    assert book.save
  end


  test "Cannot create a book with no name" do
    book = Book.new
    assert_not book.valid?
    assert_not book.save
    assert_includes book.errors, :name
  end

  test "Cannot create a book with a duplicate name" do
    orig_book = Book.create(name: "Americanah")
    duplicate_book = Book.new(name: "Americanah")
    assert_no_difference('Book.count') do
      assert_not duplicate_book.valid?
      assert_not duplicate_book.save
    end
  end

  test "Can create a book with no author; default author will be set to 'Anonymous'" do
    book = Book.new(name: "Giovanni's Room")
    assert book.valid?
    assert book.save
    assert_equal book.author, "Anonymous"
  end

  test "Can create a book with a positive initial ranking value" do
    book = Book.new(name: "Stir It Up", ranking: 10)
    assert book.valid?
    assert book.save
    assert_equal book.ranking, 10
  end

  test "Cannot create a book with a negative ranking value" do
    book = Book.new(name: "The Unbearable Lightness of Being", ranking: -10)
    assert_not book.valid?
    assert_not book.save
  end

  test "Can create a book with an initial ranking value of 0" do
    book = Book.new(name: "Where'd You Go, Bernadette?", ranking: 0)
    assert book.valid?
    assert book.save
    assert_equal book.ranking, 0
  end

  test "Book created without initial ranking value will have ranking: 0" do
    book = Book.new(name: "The Beautiful Struggle")
    assert book.valid?
    assert book.save
    assert_equal book.ranking, 0
  end

  test "Update of name or author does not change ranking" do
    book = books(:book_9)
    initial_rank = book.ranking
    book.update(author: "Barbara Kingsolver")
    assert_equal initial_rank, book.ranking
    book.update(name: "Animal, Vegetable, Miracle")
    assert_equal initial_rank, book.ranking
  end
end
