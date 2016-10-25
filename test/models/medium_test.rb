require 'test_helper'

class MediumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
#validations
  test 'A Medium Must Have a Title' do
  	assert media(:flood).valid?
  end

# raise error if no title

#   title must be a string
#   maker name must be a string
#   description must be a string

# title cannot be just spaces
# maker name cannot be just spaces
# description cannot be just spaces




  test 'A Medium Must Have a Maker' do
  	assert_equal( media(:flood).maker, 'They Might Be Giants')
  end

  raise error if no maker

  test 'A Medium Must Have a Description' do
     assert_not_nil( media(:flood), :description)
  end

  raise error if no description

end
