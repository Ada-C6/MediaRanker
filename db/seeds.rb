# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
movies = [
  {title: "The Far Side Window",
   director: "William Reed",
   description: "There's a window on the far where a man looks into the inner depths of his soul."
  },

  {title: "Die Hard",
   director: "John McTiernan",
   description: "Bruce Willis shoots people who ruin his Christmas party."
  },

  {title: "Toy Story",
   director: "John Lasseter",
   description: "Tim Allen is a spaceguy, Tom Hanks is a cowboy"
  },

  {title: "Some Movie",
  director: "Director no 1",
  description: "Some movie by director no 1"
  },

  {title: "Superbad",
   director: "Greg Mottola",
   description: "teenage guys are dumb"
  },

  {title: "Airplane",
   director: "David Zucker",
   description: "people in airplane"
  },

  {title: "Clueless",
   director: "Some Director",
   description: "Rich teenager does stuff"
  },

  {title: "Anchorman",
   director: "Adam McKay",
   description: "the anchorman is funny"
  },

  {title: "Bridesmaids",
   director: "Paul Feig",
   description: "Bridesmaids do dumb shit before wedding"
  },

  {title: "Home Alone",
   director: "Spielberg? Maybe not.",
   description: "kid stays home alone"
  },

  {title: "Home Alone 2",
   director: "Still not Spielberg",
   description: "kid runs around NY"
  },

]
movies.each do |m|
  Movie.create(m)
end

books = [
  {title: "American Gods",
   author: "Neil Gaiman",
   description: "Guy dies in car accident and hangs out with some gods."
  },

  {title: "The Lorax",
   author: "Dr. Seuess",
   description: "The Lorax saves the trees. The Lorax is some fat mystical being that lives with the trees."
  },

  {title: "Harry Potter",
   author: "JK Rowling",
   description: "Kid with scar turns out to be a wizard."
  },

 {title: "Babysitter's Club",
  author: "Ghostwriters",
  description: "there's a club full of babysitters"
 },

 {title: "Hamlet",
  author: "Shakespeare",
  description: "Some dude's all to be or not to be"
 },

 {title: "The Circle",
  author: "Dave Eggers",
  description: "Woman gets sucked into Apple corporation"
 },

 {title: "Books",
  author: "Some Author",
  description: "Here's a description"
 },

 {title: "Another Book",
  author: "Another author",
  description: "Another description"
 },

 {title: "The Berenstein Bears",
  author: "Some bear",
  description: "Family of bears"
 },

 {title: "The Unicorn",
  author: "Fairy",
  description: "Book is magical"
 },

 {title: "Ice Cream",
  author: "Vanilla",
  description: "Tasty"
 },

]
books.each do |b|
  Book.create(b)
end

albums = [
  {title: "Some Metal Album",
   artist: "Some metal band",
   description: "Some kind of music that Dan is into"
  },

  {title: "Melon Collie and the Infinite Sadness",
   artist: "Smashing Pumpkins",
   description: "The 90s had better music."
  },

  {title: "The Frozen Soundtrack",
   artist: "Some disney characters",
   description: "Don't lie, you like Let It Go"
 },

 {title: "Some Pop Album",
  artist: "Artist known as",
  description: "It's an album"
 },

 {title: "Walls",
  artist: "Kings of Leon",
  description: "there are walls in this album"
 },

 {title: "Purpose",
  artist: "Justin Bieber",
  description: "Justin Bieber has purpose"
 },

 {title: "Thunder",
  artist: "Leona Lewis",
  description: "Album called Thunder"
 },

 {title: "Sixteen Stone",
  artist: "Bush",
  description: "Bush was stoned"
 },

 {title: "Crazy Love",
  artist: "Michael Bubble",
  description: "Michael Bubbles"
 },

 {title: "Can't Feel My Face",
  artist: "The Weeknd",
  description: "The Weekend can't feel its face"
 },

 {title: "Demi",
  artist: "Demi Lovato",
  description: "Demi Lovato is bad at album names"
 }
]
albums.each do |a|
  Album.create(a)
end
