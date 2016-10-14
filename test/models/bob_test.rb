require 'test_helper'

class BobTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "A Bob must have a name" do
    bobs_burgers = Bob.new
    assert_not bobs_burgers.valid? "A Bob without a name is invalid."
    bobs_burgers.name = "Belcher"
    assert bobs_burgers.valid?  "Somehow Belcher is not a valid name."
  end

end
