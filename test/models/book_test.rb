require 'test_helper'

# This test is very similar to the other two model tests - because other than the name of the author/artist/director they're exactly the same. If I have time, I might consider trying to model all of these things together. 

class BookTest < ActiveSupport::TestCase
  test "create a new books with valid data" do
    assert books(:one).valid?
    assert books(:two).valid?
  end

  test "book cannot be updated to not include valid data" do
    book = books(:one)
    book.author = nil

    assert_not book.valid?
        assert_not book.save
        assert_includes book.errors, :author
  end

  test "create a book with invalid title fails" do
    no_title = Book.new(author:"Julie", description: "The avant garde.")

    assert_not no_title.valid?
  end

  test "create a book with invalid author fails" do
    no_author = Book.new(title:"July", description: "It's the fourth!")

    assert_not no_author.valid?
  end

  test "create a book with invalid description fails" do
    no_description = Book.new(title:"Jude", author: "Law")

    assert_not no_description.valid?
  end

  test "top_ten returns 10 books when there are 10 books" do
    num_books = Book.count
    # I do not have a validation that titles need to be unique, so this will still work.
    until num_books == 10 do
      Book.create(title:"another", description:"a thing", author:"me")
      num_books += 1
    end

    #now I have 10 books.
    assert_equal Book.top_ten.count, 10
  end

  test "top_ten returns all the books when there are fewer than 10 books" do
    num_books =  Book.count
    # make sure there are less than 10 books, but there are some.
    assert num_books < 10 && num_books >= 1

    assert_equal  Book.top_ten.count,  Book.count
  end

  test "top_ten returns 10 books when there are more than 10 books" do
    num_books =  Book.count

    # I do not have a validation that titles need to be unique, so this will still work.
    until num_books == 15 do
       Book.create(title:"another", description:"a thing", author:"me")
      num_books += 1
    end

    assert_equal  Book.top_ten.count, 10

  end

  test "top_ten returns a collection of no books when there are no books (not nil)" do
    # because of fixtures, I have to delete the existing books before running this test
    num_books =  Book.count

    if num_books > 0
       Book.destroy_all
    end

    assert_empty  Book.top_ten
    assert_not_nil  Book.top_ten
  end

  test "top_ten returns books in descending order of rank" do
    ranked_books = Book.top_ten

    ranked_books.each_with_index do |book, i|
        assert book.rank >= ranked_books[i+1].rank
        # I want this to only keep going until the second to last book, because there's nothing to compare the last book to.
        break if i == ranked_books.length-2
    end
  end
end
