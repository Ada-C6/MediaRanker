require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # test validations for books

  test 'books must have a name' do
    hello = Book.new(votes: 12000000)
    assert_not(hello.valid?, "books need names to be valid")

    hello.name = "Kanye"
    assert(hello.valid?, "somehow hello is not valid")
  end

  test 'books must have a name, fixture edition' do
    assert(books(:dreams).valid?, "book should be valid")
    assert(books(:in_the_woods).valid?, "book should be valid")
  end

  test 'fixture books should have the correct names' do
    assert_equal(books(:dreams).name, "Dreams of My Father", "the titles are not equal")
    assert_equal(books(:in_the_woods).name, "In The Woods", "the titles are not equal")
  end

  test 'books must have a number of votes' do
    blah = Book.new(name: "kevin")
    assert_not(blah.valid?, "kevin should have nil votes, why doesn't he?")

    blah.votes = 4
    assert(blah.valid?, "now kevin should be valid")

     assert(books(:dreams).valid?, "book should be valid")
     assert(books(:in_the_woods).valid?, "book should be valid")
  end

  test 'book must have a positive number of votes' do
    kevin = Book.new(name: "kevin 2.0", votes: -5)
    assert_not(kevin.valid?, "sorry kevin you need positive votes")
  end

  test 'book votes must be an integer' do
    assert_equal(books(:dreams).votes.class, Fixnum, "oh no it's not an int!")
    assert_equal(books(:in_the_woods).votes.class, Fixnum, "oh no it's not an int!")

    kevin = Book.new(name: "kevgelica", votes: [2,4,5,5])
    assert_not(kevin.valid?, "votes can't be an array")

    kevin.votes = :one
    assert_not(kevin.valid?, "votes can't be a symbol")

    kevin.votes = {hello: 'it"s me'}
    assert_not(kevin.valid?, "votes can't be a hash")

    kevin.votes = 3.125354634343434645323
    assert_not(kevin.valid?, "votes can't be a float")
  end

end
