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
