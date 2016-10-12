require 'test_helper'

class BookTest < ActiveSupport::TestCase

    test "Create a book with all data" do
    book = Book.create(name: "Beaches of the World", author: "Will Jones", description: "beaches")
    assert book.valid?
  end

    test "Create a book with just all required data" do
    book = Book.create(name: "Beaches of the World")
    assert book.valid?
  end

  test "Cannot create a book with only unrequired data" do
    book = Book.create(author: "Beaches of the World", description: "beaches")
    assert_not book.valid?
  end

  test "Activating upvote method adds 1 to the book.ranking" do
      book = books(:harry_potter)
      book.upvote
      assert_equal book.ranking, 1
  end
end
