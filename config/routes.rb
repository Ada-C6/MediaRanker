Rails.application.routes.draw do
  
  root to: 'welcome#index'
  
  # # this will be the page where the top ten lives
  get 'index/index'

  get 'index/show' => 'index#show', as: 'index_show'

  get 'index/new'

  post 'index/create'

  get 'index/edit'

  put 'index/update'

  delete 'index/destroy'

  # movies routes

  get 'movies/index' => 'movies#index', as: 'movies_index'

  # show a movie
  get 'movies/:id/show' => 'movies#show', as: 'movies_show'

  get 'movies/new' => 'movies#new', as: 'movies_new'

  post 'movies/create' => 'movies#create', as: 'movies_create'

  get 'movies/:id/edit' => 'movies#edit', as: 'movies_edit'

  put 'movies/:id/update' => 'movies#update', as: 'movies_update'

  #put 'movies/:id/upvote' => 'movies#upvote', as: 'movies_upvote'
  get 'movies/:id/upvote' => 'movies#upvote', as: 'movies_upvote'  

  delete 'movies/:id/destroy' => 'movies#destroy', as: 'movies_destroy'

  # books routes
  get 'books/index' => 'books#index', as: 'books_index'

  get 'books/:id/show' => 'books#show', as: 'books_show'

  get 'books/new' => 'books#new', as: 'books_new'

  post 'books/create' => 'books#create', as: 'books_create'

  get 'books/:id/edit' => 'books#edit', as: 'books_edit'

  put 'books/:id/update' => 'books#update', as: 'books_update'

  get 'books/:id/upvote' => 'books#upvote', as: 'books_upvote'

  delete 'books/destroy' => 'books#destroy', as: 'books_destroy'

  # albums routes
  get 'albums/index' => 'albums#index', as: 'albums_index'

  get 'albums/:id/show' => 'albums#show', as: 'albums_show'

  get 'albums/new' => 'albums#new', as: 'albums_new'

  post 'albums/create' => 'albums#create', as: 'albums_create'

  get 'albums/:id/edit' => 'albums#edit', as: 'albums_edit'

  put 'albums/:id/update' => 'albums#update', as: 'albums_update'

  get 'albums/:id/upvote' => 'albums#upvote', as: 'albums_upvote'

  delete 'albums/:id/destroy' => 'albums#destroy', as: 'albums_destroy'

end


  