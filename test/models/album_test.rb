require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "A album must have a title in order to be valid" do
    assert albums(:one).valid?
    albums(:one).title = nil
    assert_not albums(:one).valid?
  end

  test "A album must have an artist in order to be valid" do
    assert albums(:one).valid?
    albums(:one).artist = nil
    assert_not albums(:one).valid?
  end

  test "A album must have a description in order to be valid" do
    assert albums(:one).valid?
    albums(:one).description = nil
    assert_not albums(:one).valid?
  end

  test "A album must have a unique combination of artist and title in order to be valid" do
    assert albums(:one).valid?
    albums(:one).artist = "Artist2"
    assert albums(:one).valid?
    albums(:one).title = "Title2"
    assert_not albums(:one).valid?

    assert albums(:two).valid?
    albums(:two).title = "Title3"
    assert albums(:two).valid?
    albums(:two).artist = "Artist3"
    assert_not albums(:two).valid?
  end

  test "The top_ten method returns an upvote-ranked (descending) list of ten albums" do
    assert_equal Album.top_ten.length, 10
    assert_equal Album.top_ten, [albums(:twelve), albums(:ten), albums(:eleven), albums(:nine), albums(:eight), albums(:seven), albums(:six), albums(:five), albums(:four), albums(:three)]
    assert_not Album.top_ten.include?(albums(:one))
  end

  test "The all-ranked method returns an upvote-ranked (descending) list of all albums" do
    assert_equal Album.all_ranked.length, 12
    assert_equal Album.all_ranked, [albums(:twelve), albums(:ten), albums(:eleven), albums(:nine), albums(:eight), albums(:seven), albums(:six), albums(:five), albums(:four), albums(:three), albums(:two), albums(:one)]
  end

end
