require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'book with no name is invalid' do
    assert books(:one).valid?
    books(:one).name = nil
    assert_not books(:one).valid?
  end

  test 'book with no author is invalid' do
    assert books(:one).valid?
    books(:one).author = nil
    assert_not books(:one).valid?
  end

end
