# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# MOVIES

# From Frankenstein ipsum #15 titles
descriptions = [
  "Hateful day enjoy reality in private were in earlier years.",
  "During this operation, and doomed him live and must have no exercise to return to overcome by what comment can to my heart palpitated in bud.",
  "I must return to a few sounds, and wretchedness?",
  " And could taste the impulses were beginning of life.",
  "I experienced in about five hungry babes. Among these reflections threw myself to make me be regarded my ruin.",
  "When she believed it only criminal, for a letter disturb you; I am unfortunate; I bounded within me, that protracted my madness?",
  "Have I rejoined, circumstances of my neck, and my situation, but I am blind father, and drew an extreme debility",
  "I neither the torture and will be endured intense.",
  "It appeared affected me, and the heart was partly filled my mind; and busied herself to bestow as we approached the other branches of cousin.",
  "My feelings by amiable companions, fellow creatures; I perhaps never to physiology.",
  "Unless I fell dangerously ill. My father's house. The mountain, where no hope of the infidels.",
  "The modern system of them with a cheerful notes, whilst those I betook myself useful to my home, and were my only care.",
  "Pardon this he stepped aside and astonishment. The difference between the cottage and staircase.",
  "I feel the family is now became fainter as madness on his hand, cross my rage sparkled in the vengeance of De Lacey.",
  "He talked of his companions, continually on it, and we heard during the loathing and by the fire; then you will only hopes of men should you were deemed impassable, and they arrived at Chene, a thing seemed to it is well that cannot see a mystery.",
  "He was my conclusions. I walked for vivacity."
]

movie_titles = ["It Was Calm", "Cold Gale", "Mind To Descend", "Greater Degree", "Breathless Eagerness", "Bend My Brother", "Agatha Fainted", "I Wept, Without Bounds", "I Feel His Death", "You On His Shadow", "He Was Firmly", "Many Other Plans", "The Most Imminent Peril", "Tranquil Conversation", "Highest Distinction"].shuffle

first_names = %w(Mary Ada Emma Lizzie Anne Sam Laura Simone Linnea Tove Astrid Karim Salma Silvia Jack)
last_names = %w(Shelley Lovelace Revan Austen Austin Astine Jansson Monet Lindgren Antilope Rodhe Bernadotte Winters Cervantes Osten)

movie_descriptions = descriptions.shuffle
directors_first = first_names.shuffle
directors_last = last_names.shuffle
directors = directors_first.map { |first| "#{first} #{directors_last.pop}"}

movie_titles.length.times do |i|
  movie_hash = { type: "Movie", name: movie_titles.pop, creator: directors.pop, description: movie_descriptions.pop, ranking: rand(0..100) }
  Movie.create(movie_hash)
end

# 15 Shakepeare ipsumed album titles
album_titles = [ "I am not--then, dear love--", "Some misadventure.", "So 'tis time", "Then, dreadful trumpet", "Sound is grown to bed", "Sell him worthy whose loves", "Are dearer lord?", "Sorrow To Do Deliver", "Quickly as from her cheek", "It should not", "Golden Window Breaks", "They Kiss Consume", "Till that, I say - ay?", "No, sir, I have in mine act.", "You shall never lie", "East Begin", "O Courteous"]
album_descriptions = descriptions.shuffle
artist_first = first_names.shuffle
artist_last = last_names.shuffle
artists = artist_first.map { |first| "#{first} #{artist_last.pop}"}

album_titles.length.times do |i|
  album_hash = { type: "Album", name: album_titles.pop, creator: artists.pop, description: album_descriptions.pop, ranking: rand(0..100) }
  Album.create(album_hash)
end

book_titles = [ "These are gone", "I would never", "Most encouraging Miss Bennet", "Unwilling to the last", "Your pardon", "I will be", "Pride will not hear", "By the danger", "Her poor mother's alarm", "Nothing allowed", "No such a short silence", "Worthless hussy, and graceful", "Think it were to ask", "Necessary terms", "Charming, except"]

book_descriptions = descriptions.shuffle
author_first = first_names.shuffle
author_last = last_names.shuffle
authors = author_first.map { |first| "#{first} #{author_last.pop}"}

book_titles.length.times do |i|
  book_hash = { type: "Book", name: book_titles.pop, creator: authors.pop, description: book_descriptions.pop, ranking: rand(0..100) }
  Book.create(book_hash)
end
