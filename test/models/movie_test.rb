require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "A movie must have a title in order to be valid" do
    assert movies(:one).valid?
    movies(:one).title = nil
    assert_not movies(:one).valid?
  end

  test "A movie must have a director in order to be valid" do
    assert movies(:one).valid?
    movies(:one).director = nil
    assert_not movies(:one).valid?
  end

  test "A movie must have a description in order to be valid" do
    assert movies(:one).valid?
    movies(:one).description = nil
    assert_not movies(:one).valid?
  end

  test "A movie must have a unique combination of director and title in order to be valid" do
    assert movies(:one).valid?
    movies(:one).director = "Director2"
    assert movies(:one).valid?
    movies(:one).title = "Title2"
    assert_not movies(:one).valid?

    assert movies(:two).valid?
    movies(:two).title = "Title3"
    assert movies(:two).valid?
    movies(:two).director = "Director3"
    assert_not movies(:two).valid?
  end

  test "The top_ten method returns an upvote-ranked (descending) list of ten movies" do
    assert_equal Movie.top_ten.length, 10
    assert_equal Movie.top_ten, [movies(:twelve), movies(:ten), movies(:eleven), movies(:nine), movies(:eight), movies(:seven), movies(:six), movies(:five), movies(:four), movies(:three)]
    assert_not Movie.top_ten.include?(movies(:one))
  end

  test "The all-ranked method returns an upvote-ranked (descending) list of all movies" do
    assert_equal Movie.all_ranked.length, 12
    assert_equal Movie.all_ranked, [movies(:twelve), movies(:ten), movies(:eleven), movies(:nine), movies(:eight), movies(:seven), movies(:six), movies(:five), movies(:four), movies(:three), movies(:two), movies(:one)]
  end

end
