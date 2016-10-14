require 'test_helper'

class WizardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "A Widard must have a title" do
    harry = Wizard.new
    assert_not harry.valid? "A Wizard without a name is invalid."
  end
end
