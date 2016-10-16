# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first).

require 'csv'

CSV.read("seed_csvs/movies.csv").each do |t|
  Movie.create(id: t[0], name: t[1], director: t[2], description: t[3])
end
