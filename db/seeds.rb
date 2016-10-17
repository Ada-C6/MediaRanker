# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

50.times do
	Book.create({
		name: Faker::Book.title.titleize, 
		author: Faker::Book.author.titleize, 
		description: "A #{Faker::Book.genre.downcase} book", 
		rank: rand(1..100)
		}
	)
end

50.times do 
	Album.create(
		{name: "#{Faker::Hacker.adjective.capitalize} #{Faker::Hipster.word.capitalize}", 
		artist: Faker::Book.author.titleize, 
		description: Faker::Hipster.sentence.capitalize, 
		rank: rand(1..100)
		}
	)
end

50.times do 
	Movie.create(
		{name: Faker::Company.catch_phrase.titleize, 
		director: Faker::Book.author.titleize, 
		description: Faker::Company.bs.capitalize, 
		rank: rand(1..100)
		}
	)
end