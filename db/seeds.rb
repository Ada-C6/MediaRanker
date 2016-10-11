# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

######## BOOKS ########
books = [
  { title: "Book1",
    author: "Author1",
    description: "A great first book!",
    rank: 0
  },
  { title: "Book2",
    author: "Author2",
    description: "A great second book!",
    rank: 0
  }
]

books.each do |book|
  Book.create(book)
end


######## Albums ########
albums = [
  { title: "Album1",
    artist: "Artist1",
    description: "A great first album!",
    rank: 0
  },
  { title: "Album2",
    artist: "Artist2",
    description: "A great second album!",
    rank: 0
  }
]

albums.each do |album|
  Album.create(album)
end


######## Movies ########
movies = [
  { title: "Movie1",
    director: "Director1",
    description: "A great first movie!",
    rank: 0
  },
  { title: "Movie2",
    director: "Director2",
    description: "A great second movie!",
    rank: 0
  }
]

movies.each do |movie|
  Movie.create(movie)
end
