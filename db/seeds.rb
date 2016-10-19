# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = [
  {
    name: "The Ring",
    year: 2002,
    description: "Little Girl, down a well. Haunts Everyone",
    rank: 1
  },
  {
    name: "The Shining",
    year: 1980,
    description: "Man babysits house, chaos ensues",
    rank: 2
  },
  {
    name: "El Orphato",
    year: 2007,
    description: "Una madre busca su hijo, pero el no es perdido",
    rank: 3
    }]

    movies.each do |movie|
      Movie.create(movie)
    end

    novels =[
      {
        title: "The Remains of Day",
        author: "Ishiguro",
        description: "Learned not to waste life",
        rank: 1
      },
      {
        title: "Anna Karenina",
        author: "Tolstoy",
        description: "Learned that no man is worth it",
        rank: 2
      },
      {
        title: "The Handmaid's Tale",
        author: "Atwood",
        description: "Learned what America could be in 2016",
        rank: 3
      }
    ]

    novels.each do |book|
      Book.create(book)
    end

    albums = [
      {
        title: "Wolfgang Amadeus",
        artist: "Pheonix",
        best_song: "1901",
        description: "Songs tend not to make sense",
        rank: 1
      },
      {
        title: "Vampire Weekend",
        artist: "Vampire Weekend",
        best_song: "A-Punk",
        description: "Songs tend not to make sense",
        rank: 2
      },
      {
        title: "When the Pawn..",
        artist: "Fiona Apple",
        best_song: "I Know",
        description: "Having affairs",
        rank: 3
        }]

        albums.each do |song|
          Album.create(song)
        end
