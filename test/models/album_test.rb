require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "An album must have a title" do
    assert albums(:one).valid?
    refute albums(:three).valid?
  end

  test "An album must have a rank" do
    assert albums(:one).valid?
    refute albums(:four).valid?
  end
end
