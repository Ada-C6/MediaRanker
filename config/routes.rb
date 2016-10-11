Rails.application.routes.draw do

    root 'home#index'
    resources :home, only: [:index]

    resources :albums
    patch 'albums/:id/upvote' => 'albums#upvote', as: 'album_upvote'

    resources :books

    resources :movies
end
