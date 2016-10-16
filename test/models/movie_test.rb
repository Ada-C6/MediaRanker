require 'test_helper'

class MovieTest < ActiveSupport::TestCase
    test "Can create a movie with only a name provided" do
        assert movies(:valid_data).valid?
    end

    test "Cannot create a movie without a name" do
        movie = Movie.new
        assert_not movie.valid?
    end

    test "Create two movies with different titles" do
        movie1 = movies(:valid_data)
        movie2 = movies(:another_movie)
        assert movie2.valid?
    end

    test "Cannot create two movies with the same title" do
        movie1 = movies(:valid_data)
        movie2 = Movie.new(name: "Hello")
        assert_not(movie2.valid?)
    end

    test "Can create a movie with a description 808 characters long" do
        movie1 = movies(:valid_data)
        movie2 = Movie.new(name: "Hello")
        assert_not(movie2.valid?)
    end

    test "Cannot create a movie with a description 810 characters long" do
        movie_too_long = Movie.new(name: "Too Long", description: "Here is a description of Movie Title #12. It is a great movie, worth reading and possibly adding to your personal library. You will not be disappointed. Check this movie out from your local library so you can form your own opinion and upvote it here. klsjdf lkajsf jej faiosejf esj oiasejf lsdjf ;oasjef ojsdfkl jasefj sodf lsdfj oisejf SDJf lKSDJFo iejw lKDSFJ l;SEF SIefj l;KSZDf os;IF ;KLSDJf l;SJf;ijsefl j SDKL:fj es f;oSJDF l;kSDJFio SJefm LS:Dfj ;djf ;LKSDFj ;Ldjs ;ILEJSF l;SDJF SDIJfp oSfj ko;SDfopPSEfj PAEIOSfj lsidfj IOSEfj KL o;iSDfj efj DFIJS IOSEf oIAEJSf oDJS fo;IJSDF ;oIJDF ioSdfj dios;f jo;ISJf io;SDFJ ;SDKOFj ;Sdfj ;Jf :IOSDFJ ads o;iASdfj AKLSdj O:IADJ ;AOId oSDFJ S:OIDF :OSjm S:DFJ oiDJSf L:DFSZ O:IDSZJF ;oISJDf ;OSDFJ L:SDIFj L:SDKFJ O:ISDJf ;DFJS ;sIOJF ;oDFJS IO:SEfjDJSF ;SDFJ ioSfjUH")
        assert_not(movie_too_long.valid?)
    end

    test "Creating a new movie will instantiate vote count at zero" do
        b = Movie.new
        assert_equal(0, b.votes)
    end

    test "Calling upvote_one increments votes by 1 correctly when starting with a new movie" do
        b = Movie.new
        b.upvote_one
        assert_equal(1, b.votes)
    end

    test "Calling upvote_one increments votes by 1 correctly with any integer higher than zero" do
        b = Movie.new
        b.votes = 5
        b.upvote_one
        assert_equal(6, b.votes)
    end

    test "Cannot set votes to a negative integer" do
        b = Movie.new(name: "yellow")
        b.votes = -4
        assert(b.invalid?)
        assert_includes(b.errors, :votes)
    end

    test "Votes cannot be set to nil" do
        b = Movie.new(name: "yellow")
        b.votes = nil
        assert(b.invalid?)
        assert_includes(b.errors, :votes)
    end
end
