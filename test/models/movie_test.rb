require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "A movie must have a name, a director, and a description" do
    fake_movie = Movie.new
    assert fake_movie.invalid? "A book must have a name, an author, and a description"

    fake_movie_name = Movie.new ({name: "Land Before Time", director: nil, description: nil, votes: 0})
    assert fake_movie_name.invalid? "A book must have a name, an author, and a description"

    fake_movie_name_director = Movie.new ({name: "Land Before Time", director: "Mr. Dinosaur", description: nil, votes: 0})
    assert fake_movie_name_director.invalid? "A book must have a name, an author, and a description"

    fake_movie_name_director_description = Movie.new ({name: "Land Before Time", director: "Mr. Dinosaur", description: "A never-ending series about cute dinosaurs", votes: 0})
    assert fake_movie_name_director_description.valid?
  end

  test "A movie's vote attirbute must be a number." do
    fake_movie_nonnum_vote = Movie.new ({name: "Land Before Time", director: "Mr. Dinosaur", description: "A never-ending series about cute dinosaurs", votes: :pancakes})
    assert fake_movie_nonnum_vote.invalid?
  end

  test "Correctly retrieves the attributes of a movie" do
    assert_equal movies(:aladin).name, "Aladin"
    assert_equal movies(:aladin).director, "Walt Disney"
    assert_equal movies(:aladin).description, "Petty theft befriends multi-personality genie and uses sorcery to entice a princess"
    assert_equal movies(:aladin).votes, 1
  end
end
