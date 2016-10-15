require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "Can create a movie with unique name and director" do
    movie = Movie.new(name: "Moulin Rouge", director: "Baz Luhrman")
    assert movie.valid?
    assert movie.save
  end

  test "Cannot create a movie with no name" do
    movie = Movie.new
    assert_not movie.valid?
    assert_not movie.save
    assert_includes movie.errors, :name
  end

  test "Cannot create a movie with a duplicate name" do
    orig_movie = Movie.create(name: "Harry Potter and the Sorcerer's Stone")
    duplicate_movie = Movie.new(name: "Harry Potter and the Sorcerer's Stone")
    assert_no_difference('Movie.count') do
      assert_not duplicate_movie.valid?
      assert_not duplicate_movie.save
    end
  end

  test "Can create a movie with no director; default director will be set to 'Unattributed'" do
    movie = Movie.new(name: "The Red Violin")
    assert movie.valid?
    assert movie.save
    assert_equal movie.director, "Unattributed"
  end

  test "Can create a movie with a positive initial ranking value" do
    movie = Movie.new(name: "Amelie", ranking: 10)
    assert movie.valid?
    assert movie.save
    assert_equal movie.ranking, 10
  end

  test "Cannot create a movie with a negative ranking value" do
    movie = Movie.new(name: "Go Fish", ranking: -10)
    assert_not movie.valid?
    assert_not movie.save
  end

  test "Can create a movie with an initial ranking value of 0" do
    movie = Movie.new(name: "Saving Face", ranking: 0)
    assert movie.valid?
    assert movie.save
    assert_equal movie.ranking, 0
  end

  test "Movie created without initial ranking value will have ranking: 0" do
    movie = Movie.new(name: "But I'm a Cheerleader")
    assert movie.valid?
    assert movie.save
    assert_equal movie.ranking, 0
  end

  test "Update of name or director does not change ranking" do
    movie = movies(:movie_9)
    initial_rank = movie.ranking
    movie.update(director: "Sofia Coppola")
    assert_equal initial_rank, movie.ranking
    movie.update(name: "Better Than Chocolate")
    assert_equal initial_rank, movie.ranking
  end

  test "Cannot update a movie to have no name" do
    movie = movies(:movie_4)
    movie.name = nil
    assert_not movie.valid?
    assert_not movie.save
    assert_includes movie.errors, :name
  end
end
