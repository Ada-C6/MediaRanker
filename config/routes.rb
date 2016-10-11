Rails.application.routes.draw do
  get 'media_ranker/index'

  resources :mediaranker
  resources :albums
  resources :books
  resources :movies
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
