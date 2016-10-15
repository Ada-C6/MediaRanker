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
  }
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
  }
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
  }
]
albums.each do |a|
  Album.create(a)
end
