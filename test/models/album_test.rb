require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # test validations for album

  test 'album must have a name' do
    kanye = Album.new(votes: 12000000)
    assert_not(kanye.valid?, "albums need names to be valid")

    kanye.name = "Kanye"
    assert(kanye.valid?, "somehow kanye is not valid")
  end

  test 'album must have a name, fixture edition' do
    assert(albums(:the_voyager).valid?, "album should be valid")
  end

  test 'fixture albums should have the correct names' do
    assert_equal(albums(:the_voyager).name, "The Voyager", "the titles are not equal")
    assert_equal(albums(:the_long_way_round).name, "The Long Way Round", "the titles are not equal")
  end

  test 'album must have a number of votes' do
    blah = Album.new(name: "kevin")
    assert_not(blah.valid?, "kevin should have nil votes, why doesn't he?")

    blah.votes = 4
    assert(blah.valid?, "now kevin should be valid")

     assert(albums(:the_voyager).valid?, "album should be valid")
     assert(albums(:the_long_way_round).valid?, "album should be valid")
  end

  test 'album must have a positive number of votes' do
    kevin = Album.new(name: "kevin 2.0", votes: -5)
    assert_not(kevin.valid?, "sorry kevin you need positive votes")
  end

  test 'album\'s votes must be an integer' do
    assert_equal(albums(:the_voyager).votes.class, Fixnum, "oh no it's not an int!")
    assert_equal(albums(:the_long_way_round).votes.class, Fixnum, "oh no it's not an int!")

    kevin = Album.new(name: "kevgelica", votes: [2,4,5,5])
    assert_not(kevin.valid?, "votes can't be an array")

    kevin.votes = :one
    assert_not(kevin.valid?, "votes can't be a symbol")

    kevin.votes = {hello: 'it"s me'}
    assert_not(kevin.valid?, "votes can't be a hash")

    kevin.votes = 3.125354634343434645323
    assert_not(kevin.valid?, "votes can't be a float")
  end


end
