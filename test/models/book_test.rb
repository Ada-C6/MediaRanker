require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "validations: book name can't be blank" do 
    book = Book.new

    assert_not book.valid?
    assert book.errors.keys.include?(:name), "name is not present"
  end

  test 'should not save book witout name' do

    book = Book.new
    assert_not book.save, "Cannot savem moive without a name"
  end
end
