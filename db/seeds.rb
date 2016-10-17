# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Add a few books
  books = Book.create([
    {
      title: "Jane Eyre",
      author: "Charlotte Bronte",
      description: "Poor Jane, we want her to be happy."
    },
    {
      title: "Pride and Prejudice",
      author: "Jane Austen",
      description: "Lizzie gets Darcy in the end, oops, spoiler."
    }
    ])

# Add a few movies
  movies = Movie.create([
    {
      title: "Home for the Holidays",
      director: "Jodie Foster",
      description: "bogey bogey par par"
    },
    {
      title: "Inception",
      director: "Christopher Nolan",
      description: "layers and layers of dreams within dreams."
    }
    ])

# Add a few albums
  albums = Album.create([
    {
      title: "21",
      artist: "Adele",
      description: "The best."
    },
    {
      title: "Collective Soul",
      artist: "Collective Soul",
      description: "She gathers rain (this weekend, in the storm)."
    }
    ])
