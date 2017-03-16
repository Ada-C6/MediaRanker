require 'test_helper'

class MediumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
#validations
  test 'A Medium Must Have a Title' do
  	assert media(:flood).valid?
  end

  test 'A Medium Must Have a Maker' do
  	assert_equal( media(:flood).maker, 'They Might Be Giants')
  end

  test 'A Medium Must Have a Description' do
     assert_not_nil( media(:flood), :description)
  end

end
