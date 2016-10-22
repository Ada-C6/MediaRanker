require 'test_helper'

class CapstoneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "A capstone must have a name, genre, and description" do
    capstones(:one).valid?
    capstones(:one).name = nil
    assert_not capstones(:one).valid?
    capstones(:one).description = nil
    assert_not capstones(:one).valid?
  end
end
