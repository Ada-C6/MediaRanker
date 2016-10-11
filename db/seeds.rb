# SEEDS MOVIES

movies_seed = [
      {
        name: "Frozen",
        director: "Disney"
        description: "Orphan sisters",
        upvotes: 5,

      },
      {
        name: "Harry Potter",
        director: "JK Rowling"
        description: "It's also a movie!",
        upvotes: 200,

      },
      {
        name: "Secret life of Pets",
        director: "Animation Imagination!!!"
        description: "Who let the dogs out?",
        upvotes: 2,

      },
      {
        name: "A River Runs Through it",
        director: "A Classic"
        description: "Poor Brad Pitt",
        upvotes: 0,

      },
    ]

movies_seed.each do |movie|
  Movie.create movie
end

# SEEDS BOOKS

books_seed = [
      {
        name: "Lord of the Rings",
        author: "JRR Tolkein"
        description: "Hobits and rings",
        upvotes: 5,

      },
      {
        name: "Harry Potter",
        author: "JK Rowling"
        description: "School and magic",
        upvotes: 200,

      },
      {
        name: "Pat the Bunny",
        author: "A children's book"
        description: "Tactile reading!",
        upvotes: 2,

      },
      {
        name: "Red Fish Blue Fish",
        author: "Dr Suess"
        description: "One Fish Two Fish!",
        upvotes: 0,

      },
    ]

books_seed.each do |book|
  Book.create book
end

# SEEDS ALBUMS

albums_seed = [
      {
        name: "Lord of the Rings Soundtrack",
        artist: "An Orchestra"
        description: "Hobits and rings and songs",
        upvotes: 5,

      },
      {
        name: "Harry Potter",
        artist: "Another Orchestra"
        description: "School and magic... something wicked this way comes!",
        upvotes: 200,

      },
      {
        name: "Ms Independent",
        artist: "Destiny's Child"
        description: "Beyonce was always a superstar",
        upvotes: 2,

      },
      {
        name: "The Wheels on the Bus",
        artist: "Mom"
        description: "All through the town",
        upvotes: 0,

      },
    ]

albums_seed.each do |album|
  Album.create book
end
