require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "Movie cannot be created without a title or director" do
    movie = Movie.new(description: "Why is there no title or director")
    assert_not movie.save
    assert_includes movie.errors, :title && :by
  end

  test "Initial ranked should be 0" do
    movie = Movie.new(title: "Titanic", by: "James Cameron")
    assert_equal movie.ranked, 0
  end

  test "Movie has title, by, ranked and description attributes" do
    assert_includes movies(:et).attributes, (:title && :by && :ranked && "description")
  end

  test "Upvote will add one to the ranked attribute" do
    expected = movies(:et).ranked + 1
    movies(:et).upvote
    assert_equal movies(:et).ranked, expected
  end

  test "Movie.by_rank should return all movies in order of highest ranked" do
    movies = Movie.by_rank
    assert movies.first.ranked > movies.last.ranked
  end

end
