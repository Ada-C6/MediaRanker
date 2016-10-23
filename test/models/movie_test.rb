require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Movie must have a name, director, genre and rank" do
    assert movies(:mean_girls).valid? "Mean girls should be valid"

    movies(:mean_girls).title = nil  ## This name removal is local to the test data - it doesn't change the fixture
    assert_not movies(:mean_girls).valid? "Mean girls should no longer be valid"

    movies(:how_to_lose).rank = nil
    assert_not movies(:how_to_lose).valid? "How to Lose a Guy should no longer be valid"
  end

  test "Books must have a unique combination of title and author" do
    assert movies(:mean_girls_title).valid? "Mean Girls with same title and different author should be valid"

    assert_not Movie.new(  title: "Mean Girls", director: "Mark Waters", genre: "Comedy", description: "Some Girls in High School", rank: 3).valid? "Mean Girls with same title and same author should not be valid"
  end

  test 'Books can be upvotes or downvote on' do
    movies(:mean_girls).upvote
    assert_equal movies(:mean_girls).rank, 4

    movies(:mean_girls).downvote
    assert_equal movies(:mean_girls).rank, 3
  end
end
