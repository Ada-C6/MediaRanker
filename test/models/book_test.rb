require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "A book must have a name, genre, and description" do
    books(:one).valid?
    books(:one).name = nil
    assert_not books(:one).valid?
    books(:one).genre = nil
    assert_not books(:one).valid?
    books(:one).description = nil
    assert_not books(:one).valid?
  end

end
