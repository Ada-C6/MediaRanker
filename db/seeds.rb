10.times do |i|
    album_hash = { name: "Album Title \##{(i+1)}", artist: "Artist Name \##{(i+1)}", description: "Here is a description of Album Title \##{(i+1)}. It is a great album, worth listening to and possibly adding to your personal collection. You will not be disappointed. Check out this album from your local library so you can make your own opinion and upvote it here.", rank: 0 }
    Album.create(album_hash)
end

14.times do |i|
    book_hash = { name: "Book Title \##{(i+1)}", author: "Author Name \##{(i+1)}", description: "Here is a description of Book Title \##{(i+1)}. It is a great book, worth reading and possibly adding to your personal library. You will not be disappointed. Check this book out from your local library so you can form your own opinion and upvote it here.", rank: 0 }
    Book.create(book_hash)
end

12.times do |i|
    movie_hash = { name: "Movie Title \##{(i+1)}", director: "Director Name \##{(i+1)}", description: "Here is a description of Movie Title \##{(i+1)}. It is a great movie, worth watching and possibly adding to your personal viewing collection. You will not be disappointed. Check this movie out from your local library so you can form your own opinion and upvote it here.", rank: 0 }
    Movie.create(movie_hash)
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
