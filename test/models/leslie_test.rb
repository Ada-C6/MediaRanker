require 'test_helper'

class LeslieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "A Leslie must have a title" do
    dracula = Leslie.new
    assert_not dracula.valid? "A Leslie without a name is invalid."
    dracula.title = "Dracula"
    assert dracula.valid? "Weird"
  end
end
