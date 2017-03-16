require 'test_helper'

class BookTest < ActiveSupport::TestCase

  test "A book must have a name, an author, and a description" do
    fake_book = Book.new
    assert fake_book.invalid? "A book must have a name, an author, and a description"

    fake_book_name = Book.new ({name: "A Wrinkle in Time", author: nil, description: nil, votes: 0})
    assert fake_book_name.invalid? "A book must have a name, an author, and a description"

    fake_book_name_author = Book.new ({name: "A Wrinkle in Time", author: "Madeline L'Engle", description: nil, votes: 0})
    assert fake_book_name_author.invalid? "A book must have a name, an author, and a description"

    fake_book_name_author_description = Book.new ({name: "A Wrinkle in Time", author: "Madeline L'Engle", description: "A young girl must traverse the multiverse to save her quirky brother and father.", votes: 0})
    assert fake_book_name_author_description.valid?
  end

  test "A books vote attribute must be a number." do
    fake_book_nonnum_vote = Book.new ({name: "A Wrinkle in Time", author: "Madeline L'Engle", description: "A young girl must traverse the multiverse to save her quirky brother and father.", votes: "two"})
    assert fake_book_nonnum_vote.invalid?
  end
  
#I don't think this is entirely necessary. It just seemed like I wasn't really testig much in the model...
  test "Correctly retrieves the attributes of a book" do
    assert_equal books(:holes).name, "Holes"
    assert_equal books(:holes).author, "Louis Sachar"
    assert_equal books(:holes).description, "Deviant youth dig holes in the desert for a lipstick-loving cowgirl"
    assert_equal books(:holes).votes, 2
  end

end
