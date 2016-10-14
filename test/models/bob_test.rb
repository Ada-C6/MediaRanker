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
  
  test "two bobs can have same name but not same appears_in" do
    assert_equal bobs(:bob_burger).name, bobs(:bob_burger_two).name
    refute_equal bobs(:bob_burger).identifying_quality, bobs(:bob_burger_two).identifying_quality
    assert bobs(:bob_burger_two).valid? "Oddly two bobs cannot be the same"

    bob_three = Bob.new(name: "Bob Burger", identifying_quality: "store owner")
    assert_not bob_three.valid? "Cannot have same identifying_quality"
  end

end
