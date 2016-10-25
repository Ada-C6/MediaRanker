require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "A movie must have a title" do
    assert movies(:one).valid?
    refute movies(:three).valid?
  end

  test "A movie must have a rank" do
    assert movies(:one).valid?
    refute movies(:four).valid?
  end

end
