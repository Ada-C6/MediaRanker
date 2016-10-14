require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'movie with no name is invalid' do
    assert movies(:one).valid?
    movies(:one).name = nil
    assert_not movies(:one).valid?
  end

  test 'movie with no director is invalid' do
    assert movies(:one).valid?
    movies(:one).director = nil
    assert_not movies(:one).valid?
  end

end
