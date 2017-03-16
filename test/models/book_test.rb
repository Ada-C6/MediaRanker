require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "An book must have a name" do
    assert books(:corduroy).valid?
    books(:corduroy).name = nil
    assert_not books(:corduroy).valid?
  end

end
