require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "Create a book with valid data" do
    book = Book.new(name: "Gone with the Wind", author: "Margaret Mitchell", ranked: 0)
    assert book.valid?
  end

  test "Create a book with no name" do
    book = Book.new(author: "Kelly", ranked: 0)
    assert_not book.save
    assert_includes book.errors, :name
  end

  test "Create two books with the same name" do
    book1 = books(:the_prince)
    book2 = Book.create(name: "The Prince", author: "Kelly", ranked: 0)
    assert_not book2.valid?
  end

  test "Create a book with no author" do
    book = Book.new(name: "Gone with the Wind", ranked: 0)
    assert_not book.save
    assert_includes book.errors, :author
  end

  test "Create a book with no ranking" do
    book = Book.new(name: "Hello", author: "Kelly")
    assert_not book.save
    assert_includes book.errors, :ranked
  end

  test "Create a book with non-numerical ranking" do
    book = Book.new(name: "Hello", author: "Kelly", ranked: "something")
    assert_not book.save
    assert_includes book.errors, :ranked
  end

  test "Book cannot have negative ranking" do
    book = Book.new(name: "Hello", author: "Kelly", ranked: -3)
    assert_not book.save
    assert_includes book.errors, :ranked
  end

  test "Book can have zero ranking" do
    book = Book.new(name: "Hello", author: "Kelly", ranked: 0)
    assert book.save
    assert_equal book.ranked, 0
  end

  test "Books's rankings are calculated correctly from upvote" do
    current_rank = books(:anna_karenina).ranked
    new_rank = current_rank + 1
    assert_equal books(:anna_karenina).upvote, new_rank
  end

  test "Book without a ranking should return nil from upvote" do
    assert_equal books(:no_rank).upvote, nil
  end
end
