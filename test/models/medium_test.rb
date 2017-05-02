require 'test_helper'

class MediumTest < ActiveSupport::TestCase
  test "Validations" do
    assert media(:movie_all_fields).valid?, "Movie with all fields should be valid"
    assert media(:book_all_fields).valid?, "Movie with all fields should be valid"
    assert media(:song_all_fields).valid?, "Movie with all fields should be valid"
    assert media(:movie_min_fields).valid?, "Movie with minimum required fields should be valid"
    assert_not media(:movie_missing_name).valid?, "Movie should not be valid if missing name"
    assert_not media(:movie_missing_auteur).valid?, "Movie should not be valid if missing auteur"
    assert media(:movie_zero_score).valid?, "Movie should be valid with score of zero"
    assert_not media(:movie_negative_score).valid?, "Movie should not be valid with negative score"
    assert_not media(:bad_category).valid?, "Media should not be valid with category outside Movie, Book, Song"
  end

  test "Custom Model Methods" do
    # Model has no custom methods (except validation)
  end

  test "Model Relationships" do
    # Model has no relationships
  end

  # Write at least one test for each validation on a model
  # Write at least one test for each custom method on a model
  # Write at least one test for each model relationship on a model
  # Write at least one test for each scope on a model (we'll talk about scopes next week)
end
