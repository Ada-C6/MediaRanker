require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "Create a movie with valid data" do
    movie = Movie.new(name: "Gone with the Wind", director: "Victor Fleming", ranked: 0)
    assert movie.valid?
  end

  test "Create a movie with no name" do
    movie = Movie.new(director: "Kelly", ranked: 0)
    assert_not movie.save
    assert_includes movie.errors, :name
  end

  test "Create two movies with different names" do
    movie1 = movies(:titanic)
    movie2 = Movie.create(name: "Titanic", director: "Kelly", ranked: 0)
    assert_not movie2.valid?
  end

  test "Create a movie with no director" do
    movie = Movie.new(name: "Kelly", ranked: 0)
    assert_not movie.save
    assert_includes movie.errors, :director
  end

  test "Create a movie with no ranking" do
    movie = Movie.new(name: "Hello", director: "Kelly")
    assert_not movie.save
    assert_includes movie.errors, :ranked
  end

  test "Create a movie with non-numerical ranking" do
    movie = Movie.new(name: "Hello", director: "Kelly", ranked: "something")
    assert_not movie.save
    assert_includes movie.errors, :ranked
  end

  test "Movie cannot have negative ranking" do
    movie = Movie.new(name: "Hello", director: "Kelly", ranked: -3)
    assert_not movie.save
    assert_includes movie.errors, :ranked
  end

  test "Movie can have zero ranking" do
    movie = Movie.new(name: "Hello", director: "Kelly", ranked: 0)
    assert movie.save
    assert_equal movie.ranked, 0
  end

  test "Movies's rankings are calculated correctly from upvote" do
    current_rank = movies(:titanic).ranked
    new_rank = current_rank + 1
    assert_equal movies(:titanic).upvote, new_rank
  end
  
  test "Movie without a ranking should return nil from upvote" do
    assert_equal movies(:no_rank).upvote, nil
  end
end
