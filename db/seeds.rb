# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
adjectives = %w(hot cold sizzling spicy wonderful fantabulous glorious splendiferous shocking groovy)
first_names = %w(Sally Polly John Jacob Betty Holly Trolly Folly Lolly)
last_names = %w(Jingleheimer Schmidt Johnson Davidson Scottson Mottson Smith Jones Etcetera)
colors = %w(white black blue grey teal red pink purple fuschia clear yellow orange brown)
nouns = %w(car grain waffle screw cup tea coffee plate phone chair street building brick bop-it marker)
gerunds = %w(running leaping jumping falling crying pouring underscoring boring singing gaming)


albums = [
  {name: "The #{colors.sample.capitalize} Album", artist: "#{first_names.sample.capitalize} #{last_names.sample.capitalize}" , description: "This album is #{adjectives.sample}!", rank_points: rand(0..40) },
  {name: "The #{colors.sample.capitalize} Album", artist: "#{first_names.sample.capitalize} #{last_names.sample.capitalize}", description: "This album is #{adjectives.sample}!", rank_points: rand(0..40) },
  {name: "The #{colors.sample.capitalize} Album", artist: "#{first_names.sample.capitalize} #{last_names.sample.capitalize}", description: "This album is #{adjectives.sample}!", rank_points: rand(0..40) },
  {name: "The #{colors.sample.capitalize} Album", artist: "#{first_names.sample.capitalize} #{last_names.sample.capitalize}", description: "This album is #{adjectives.sample}!", rank_points: rand(0..40) },
  {name: "The #{colors.sample.capitalize} Album", artist: "#{first_names.sample.capitalize} #{last_names.sample.capitalize}" , description: "This album is #{adjectives.sample}!", rank_points: rand(0..40) },
  {name: "The #{colors.sample.capitalize} Album", artist: "#{first_names.sample.capitalize} #{last_names.sample.capitalize}" , description: "This album is #{adjectives.sample}!", rank_points: rand(0..40) }
]

books = [
  {name: "The Chronicle of a #{nouns.sample.capitalize}", author: "#{first_names.sample.capitalize} #{last_names.sample.capitalize}", description: "This book was really #{adjectives.sample}!", rank_points: rand(0..40) },
  {name: "The Chronicle of a #{nouns.sample.capitalize}", author: "#{first_names.sample.capitalize} #{last_names.sample.capitalize}", description: "This book was really #{adjectives.sample}!" , rank_points: rand(0..40) },
  {name: "The Chronicle of a #{nouns.sample.capitalize}", author: "#{first_names.sample.capitalize} #{last_names.sample.capitalize}", description: "This book was really #{adjectives.sample}!" , rank_points: rand(0..40) },
  {name: "The Chronicle of a #{nouns.sample.capitalize}", author: "#{first_names.sample.capitalize} #{last_names.sample.capitalize}", description: "This book was really #{adjectives.sample}!" , rank_points: rand(0..40) },
  {name: "The Chronicle of a #{nouns.sample.capitalize}", author: "#{first_names.sample.capitalize} #{last_names.sample.capitalize}", description: "This book was really #{adjectives.sample}!" , rank_points: rand(0..40) },
  {name: "The Chronicle of a #{nouns.sample.capitalize}", author: "#{first_names.sample.capitalize} #{last_names.sample.capitalize}", description: "This book was really #{adjectives.sample}!" , rank_points: rand(0..40) }
]

movies = [
  {name: "The #{gerunds.sample.capitalize} #{nouns.sample.capitalize}", director: "#{first_names.sample.capitalize} #{last_names.sample.capitalize}", description: "This movie was #{adjectives.sample}", rank_points: rand(0..40) },
  {name: "The #{gerunds.sample.capitalize} #{nouns.sample.capitalize}", director: "#{first_names.sample.capitalize} #{last_names.sample.capitalize}", description: "This movie was #{adjectives.sample}", rank_points: rand(0..40) },
  {name: "The #{gerunds.sample.capitalize} #{nouns.sample.capitalize}", director: "#{first_names.sample.capitalize} #{last_names.sample.capitalize}", description: "This movie was #{adjectives.sample}", rank_points: rand(0..40) },
  {name: "The #{gerunds.sample.capitalize} #{nouns.sample.capitalize}", director: "#{first_names.sample.capitalize} #{last_names.sample.capitalize}", description: "This movie was #{adjectives.sample}", rank_points: rand(0..40) },
  {name: "The #{gerunds.sample.capitalize} #{nouns.sample.capitalize}", director: "#{first_names.sample.capitalize} #{last_names.sample.capitalize}", description: "This movie was #{adjectives.sample}", rank_points: rand(0..40) }

]


Album.create(albums)
Book.create(books)
Movie.create(movies)
