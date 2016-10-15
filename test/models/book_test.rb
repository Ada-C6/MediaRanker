require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "A valid entry will save" do
    book = books(:valid_book)

    assert book.save
    assert book.valid?
  end

  test "validations: book author can't be blank" do
    book = Book.new(title: "New Book")

    assert_not book.save
    assert_not book.valid?
    assert book.errors.keys.include?(:author), "author is not in the errors hash"
  end

  test "validations: book title can't be blank" do
    book = Book.new(author: "Allison")

    assert_not book.save
    assert_not book.valid?
    assert book.errors.keys.include?(:title), "title is not in the errors hash"
  end

  test "validations: book title must be unique" do
    book = books(:valid_book)
    assert book.save

    book2 = Book.new(title: "Valid Book", author: "Allison")
    assert_not book2.save
    assert_not book2.valid?
    assert book2.errors.keys.include?(:title), "title is not in the errors hash"
  end

  test "#upvote: should increase the rank value by 1" do
    book = books(:valid_book)

    assert book.save
    assert book.upvote
    assert book.save
    assert_equal book.rank, 1, "Rank value did not increase by 1"
  end
end
