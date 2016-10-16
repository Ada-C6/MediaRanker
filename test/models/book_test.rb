require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "Create a book with valid data" do
    book = books(:one)
    assert book.valid?
  end

  test "Cannot create an unnamed book" do
    book = Book.new
    assert_not book.valid?
    assert_includes book.errors, :title

  end

  test "Cannot create two books with different names" do
    book1 = books(:one)
    book2 = Book.new(title: "Sir David Attenborough")

    assert_not book2.valid?
  end

  test "Vote attribute must be zero or a positive integer" do
    book1 = Book.new(title: "Test", vote: -1)
    book2 = books(:two)
    book3 = books(:three)

    assert_not book1.valid?
    assert_not book1.save

    assert book2.valid?
    assert book3.valid?
  end

  test "Increases vote by one when upvote is called" do
    book = books(:two)
    assert_equal book.upvote, 38
    assert_not_equal book.upvote, 38

  end

end
