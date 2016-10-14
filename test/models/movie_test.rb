require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "create a new movie with valid data" do
    assert movies(:one).valid?
  end

  test "create a movie with invalid title fails" do
    skip
  end

  test "create a movie with invalid director fails" do
    skip
  end

  test "create a movie with invalid description fails" do
    skip
  end

  test "top_ten returns 10 albums when there are 10 albums" do
    skip
  end

  test "top_ten returns all the albums when there are fewer than 10 albums" do
    skip
  end

  test "top_ten returns 10 albums when there are more than 10 albums" do
    skip
  end

  test "top_ten returns no albums when there are no albums (does not break)" do
    skip
    # because of fixtures, may have to remove them before running this test?
  end

  test "top_ten returns albums in descending order of rank" do
    skip
  end
end
