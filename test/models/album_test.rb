require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "An album must have a title" do
    assert albums(:one).valid?
    assert_not albums(:one).invalid?
  end

  test "An album must have a artist" do
    assert albums(:one).valid?
    assert_not albums(:one).invalid?
  end

  test "An album must have a rank" do
    assert albums(:one).valid?
    assert_not albums(:one).invalid?
  end

  test "An album must have a synopsis" do
    assert albums(:one).valid?
    assert_not albums(:one).invalid?
  end

  test "Icky Thump is an album by The White Stripes" do
    assert_equal albums(:one).artist, "The White Stripes"
    assert_equal albums(:one).title, "Icky Thump"
  end

  test "Far is an album by Regina Spektor" do
    assert_equal albums(:two).artist, "Regina Spektor"
    assert_equal albums(:two).title, "Far"
  end

  test "Icky Thump has a rank of 1" do
    assert_equal albums(:one).rank, 1
    assert_equal albums(:one).title, "Icky Thump"
  end

  test "Far has a rank of 2" do
    assert_equal albums(:two).rank, 2
    assert_equal albums(:two).title, "Far"
  end

end
