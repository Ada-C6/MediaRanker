

Rails.application.routes.draw do
  root 'media_ranker#index'
  resources :mediaranker
  resources :albums
  patch 'albums/:id/upvote' => 'albums#upvote'

  resources :books
  patch 'books/:id/upvote' => 'books#upvote'

  resources :movies
  patch 'movies/:id/upvote' => 'movies#upvote'
end



# get 'albums/index'
#
# get 'albums/show'
#
# get 'albums/new'
#
# get 'albums/create'
#
# get 'albums/edit'
#
# get 'albums/update'
#
# get 'albums/delete'
#
# get 'books/index'
#
# get 'books/show'
#
# get 'books/new'
#
# get 'books/create'
#
# get 'books/edit'
#
# get 'books/update'
#
# get 'books/delete'
#
# get 'movies/index'
#
# get 'movies/show'
#
# get 'movies/new'
#
# get 'movies/create'
#
# get 'movies/edit'
#
# get 'movies/update'
#
# get 'movies/delete'
