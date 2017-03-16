require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # test validations for movies

  test 'movie must have a name' do
    hello = Movie.new(votes: 12000000)
    assert_not(hello.valid?, "movies need names to be valid")

    hello.name = "Kanye"
    assert(hello.valid?, "somehow hello is not valid")
  end

  test 'movies must have a name, fixture edition' do
    assert(movies(:catwoman).valid?, "movie should be valid")
    assert(movies(:batman).valid?, "movie should be valid")
  end

  test 'fixture movies should have the correct names' do
    assert_equal(movies(:catwoman).name, "Catwoman", "the titles are not equal")
    assert_equal(movies(:batman).name, "Batman", "the titles are not equal")
  end

  test 'movies must have a number of votes' do
    blah = Movie.new(name: "kevin")
    assert_not(blah.valid?, "kevin should have nil votes, why doesn't he?")

    blah.votes = 4
    assert(blah.valid?, "now kevin should be valid")

     assert(movies(:catwoman).valid?, "movie should be valid")
     assert(movies(:batman).valid?, "movie should be valid")
  end

  test 'movies must have a positive number of votes' do
    kevin = Movie.new(name: "kevin 2.0", votes: -5)
    assert_not(kevin.valid?, "sorry kevin you need positive votes")
  end

  test 'movie votes must be an integer' do
    assert_equal(movies(:catwoman).votes.class, Fixnum, "oh no it's not an int!")
    assert_equal(movies(:batman).votes.class, Fixnum, "oh no it's not an int!")

    kevin = Movie.new(name: "kevgelica", votes: [2,4,5,5])
    assert_not(kevin.valid?, "votes can't be an array")

    kevin.votes = :one
    assert_not(kevin.valid?, "votes can't be a symbol")

    kevin.votes = {hello: 'it"s me'}
    assert_not(kevin.valid?, "votes can't be a hash")

    kevin.votes = 3.125354634343434645323
    assert_not(kevin.valid?, "votes can't be a float")
  end

end
