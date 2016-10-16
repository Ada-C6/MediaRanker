namespace :fake do
  desc "TODO"
  task generate: :environment do
    
    15.times do
       Book.create(
          name: Faker::Book.title,
          author: Faker::Book.author,
          description: Faker::Hipster.paragraph,
          type: "Book",
        )
    end

    15.times do
       Album.create(
          name: Faker::Space.constellation,
          artist: Faker::Superhero.name,
          description: Faker::Hipster.paragraph,
          type: "Album",
        )
    end

    15.times do
       Movie.create(
          name: Faker::Space.nebula,
          director: Faker::GameOfThrones.character,
          description: Faker::StarWars.quote,
          type: "Movie",
        )
    end

  end

end
