Rails.application.routes.draw do

  root 'movies#all_media'

  resources :movies
  resources :books
  resources :albums

  patch '/movies/:id/upvote', to: 'movies#upvote', as: 'upvote_movie'
  patch '/books/:id/upvote', to: 'books#upvote', as: 'upvote_book'
  patch '/albums/:id/upvote', to: 'albums#upvote', as: 'upvote_album'
end
