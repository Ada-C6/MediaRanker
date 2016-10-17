Rails.application.routes.draw do
  root 'homepage#index'

  #creating an upvote path for each controller
  patch 'books/:id/upvote' => 'books#upvote', as: :upvote_book
  patch 'movies/:id/upvote' => 'movies#upvote', as: :upvote_movie
  patch 'albums/:id/upvote' => 'albums#upvote', as: :upvote_album

  resources :movies
  resources :albums
  resources :books
end
