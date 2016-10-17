require 'test_helper'

# This test is very similar to the other two model tests - because other than the name of the author/artist/director they're exactly the same. If I have time, I might consider trying to model all of these things together. 

class AlbumTest < ActiveSupport::TestCase
  test "create a new albums with valid data" do
    assert albums(:one).valid?
    assert albums(:two).valid?
  end

  test "album cannot be updated to not include valid data" do
    album = albums(:one)
    album.artist = nil

    assert_not album.valid?
        assert_not album.save
        assert_includes album.errors, :artist
  end

  test "create a album with invalid title fails" do
    no_title = Album.new(artist:"Julie", description: "The avant garde.")

    assert_not no_title.valid?
  end

  test "create a album with invalid artist fails" do
    no_artist = Album.new(title:"July", description: "It's the fourth!")

    assert_not no_artist.valid?
  end

  test "create a album with invalid description fails" do
    no_description = Album.new(title:"Jude", artist: "Law")

    assert_not no_description.valid?
  end

  test "top_ten returns 10 albums when there are 10 albums" do
    num_albums = Album.count
    # I do not have a validation that titles need to be unique, so this will still work.
    until num_albums == 10 do
      Album.create(title:"another", description:"a thing", artist:"me")
      num_albums += 1
    end

    #now I have 10 albums.
    assert_equal Album.top_ten.count, 10
  end

  test "top_ten returns all the albums when there are fewer than 10 albums" do
    num_albums =  Album.count
    # make sure there are less than 10 albums, but there are some.
    assert num_albums < 10 && num_albums >= 1

    assert_equal  Album.top_ten.count,  Album.count
  end

  test "top_ten returns 10 albums when there are more than 10 albums" do
    num_albums =  Album.count

    # I do not have a validation that titles need to be unique, so this will still work.
    until num_albums == 15 do
       Album.create(title:"another", description:"a thing", artist:"me")
      num_albums += 1
    end

    assert_equal  Album.top_ten.count, 10

  end

  test "top_ten returns a collection of no albums when there are no albums (not nil)" do
    # because of fixtures, I have to delete the existing albums before running this test
    num_albums =  Album.count

    if num_albums > 0
       Album.destroy_all
    end

    assert_empty  Album.top_ten
    assert_not_nil  Album.top_ten
  end

  test "top_ten returns albums in descending order of rank" do
    ranked_albums = Album.top_ten

    ranked_albums.each_with_index do |album, i|
        assert album.rank >= ranked_albums[i+1].rank
        # I want this to only keep going until the second to last album, because there's nothing to compare the last album to.
        break if i == ranked_albums.length-2
    end
  end
end
