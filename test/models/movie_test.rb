require 'test_helper'

class MovieTest < ActiveSupport::TestCase

  test "the truth" do
    assert true
  end

  test "An movie must have a name" do
    assert movies(:mulan).valid?
    movies(:mulan).name = nil
    assert_not movies(:mulan).valid?
  end

end
