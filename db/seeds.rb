# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
50.times do
	Book.create({
		name: Faker::Book.title.titlesize, 
		author: Faker::Book.author.capitalize, 
		description: "A #{Faker::Book.genre} book", 
		rank: 0
		}
	)
end

50.times do 
	Album.create(
		{name: "#{Faker::Hacker.adjective.capitalize} #{Faker::Hipster.word.capitalize}", 
		author: Faker::Book.author.capitalize, 
		description: Faker::Hipster.sentence.capitalize, 
		rank: 0
		}
	)
end

50.times do 
	Movie.create(
		{name: Faker::Company.catch_phrase.titlesize, 
		author: Faker::Book.author.capitalize, 
		description: Faker::Company.bs.capitalize, 
		rank: 0
		}
	)
end