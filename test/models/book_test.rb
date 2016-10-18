require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "A book must have a title" do
    assert books(:one).valid?
    assert_not books(:one).invalid?
  end

  test "A book must have an author" do
    assert books(:one).valid?
    assert_not books(:one).invalid?
  end

  test "A book must have a rank" do
    assert books(:one).valid?
    assert_not books(:one).invalid?
  end

  test "A book must have a synopsis" do
    assert books(:one).valid?
    assert_not books(:one).invalid?
  end

  test "Paolo Bacigalupi wrote The Windup Girl" do
    assert_equal books(:two).author, "Paolo Bacigalupi"
    assert_equal books(:two).title, "The Windup Girl"
  end

  test "Terry Pratchett and Neil Gaiman wrote Good Omens" do
    assert_equal books(:one).author, "Terry Pratchett and Neil Gaiman"
    assert_equal books(:one).title, "Good Omens"
  end

  test "Good Omens has a rank of 2" do
    assert_equal books(:one).rank, 2
    assert_equal books(:one).title, "Good Omens"
  end

  test "The Windup Girl a rank of 1" do
    assert_equal books(:two).rank, 1
    assert_equal books(:two).title, "The Windup Girl"
  end

end
