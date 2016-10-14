require 'test_helper'

class MediumTest < ActiveSupport::TestCase
  ############test on Validations#############

  # ================================
  # Test set 1: An medium must have a name to be valid

  # Positive case
  test "An medium is valid when it has a name" do
    medium = Medium.new
    assert_not medium.valid?
    medium.name = "n1"
    assert medium.valid?
  end

  # Negative case

  # Edge case

end


# ================================
# Test set 2: An medium that have nil votes should also be valid.

test "An medium that have nil votes is valid" do
  medium = 

end
