require 'test_helper'

class MovieTest < ActiveSupport::TestCase

  test "validations: movie name can't be blank" do
    movie = movies(:Pulp_Fiction)
    assert_not movie.valid?
    assert movie.errors.keys.include?(:name), "name is not in the errors hash"
  end

  test "validations: movie director can't be blank" do
    movie = movies(:Jackie_Brown)
    assert_not movie.valid?
    assert movie.errors.keys.include?(:director), "director is not in the errors hash"
  end

  test "Create an movie w/ valid data" do
    movie = movies(:Reservoir_Dogs)
    assert movie.valid?
  end

  test "Create two movies with different titles" do
    movie1 = movies(:Kill_Bill_vol_1)
    movie2 = movies(:Kill_Bill_vol_2)
    assert movie2.valid?
  end

  test "When a new movie is created, rank is 0" do
    movie = movies(:Inglorious_Basterds)
    assert movie.rank == 0
  end

  test "When a new movie is created, rank isn't something besides 0" do
    movie = movies(:The_Breakfast_Club)
    assert_not movie.rank == rand(1..2000)
    assert_not movie.rank == rand(-2000..-1)
  end
end
