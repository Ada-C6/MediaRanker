require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "Create a movie with valid data" do
    movie = Movie.new(name: "foo", director: "bar", description: "test", ranking: 0)

    assert movie.valid?
  end

  test "Movie name can't be blank" do
    movie = Movie.new(director: "bar", description: "test", ranking: 0)

    assert_not movie.valid?
  end

  test "Movie director can't be blank" do
    movie = Movie.new(name: "foo", director: nil, description: "test", ranking: 0)

    assert_not movie.valid?
  end

  test "Movie description can't be blank" do
    movie = Movie.new(name: "foo", director: "test", description: nil, ranking: 0)

    assert_not movie.valid?
  end

  test "Cannot create an movie with a nil or non-integer ranking value" do
    movie = Movie.new(name: "12", director: "bar", description: "test", ranking: nil)
    movie2 = Movie.new(name: "12", director: "bar", description: "test", ranking: 2.3)

    assert_not movie.valid?
    assert_not movie2.valid?
  end

  test "Cannot create two movies with the same title" do
    movie1 = movies(:pelicula_de_gatos)
    movie2 = Movie.new(name: "Pelicula de Gatos", director: "meow_meow", description: "los gatos hace meow", ranking: 12)

    assert_not(movie2.valid?)
  end
end
