require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "A movie must have a title" do
    assert movies(:one).valid?
    assert_not movies(:one).invalid?
  end

  test "A movie must have a year" do
    assert movies(:one).valid?
    assert_not movies(:one).invalid?
  end

  test "A movie must have a rank" do
    assert movies(:one).valid?
    assert_not movies(:one).invalid?
  end

  test "A movie must have a synopsis" do
    assert movies(:one).valid?
    assert_not movies(:one).invalid?
  end

  test "Queen of Katwe came out in 2016" do
    assert_equal movies(:two).title, "Queen of Katwe"
    assert_equal movies(:two).year, 2016
  end

  test "Interstellar came out in 2014" do
    assert_equal movies(:one).year, 2014
    assert_equal movies(:one).title, "Interstellar"
  end

  test "Interstellar has a rank of 2" do
    assert_equal movies(:one).rank, 2
    assert_equal movies(:one).title, "Interstellar"
  end

  test "Queen of Katwe a rank of 1" do
    assert_equal movies(:two).rank, 1
    assert_equal movies(:two).title, "Queen of Katwe"
  end

end
