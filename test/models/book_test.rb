require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "A book must have a title" do
    assert books(:one).valid?
    refute books(:three).valid?
  end

  test "A book must have a rank" do
    assert books(:one).valid?
    refute books(:four).valid?
  end
end
