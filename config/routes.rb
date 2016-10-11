Rails.application.routes.draw do
  get 'movies/index' => 'movies#index', as: 'index_movies'

  get 'movies/new' => 'movies#new', as: 'new_movie'

  post 'movies/create' => 'movies#create', as: 'create_movie'

  get 'movies/show/:id' => 'movies#show', as: 'show_movie'

  get 'movies/:id/edit' => 'movies#edit', as: 'edit_movie'

  put 'movies/:id/update' => 'movies#update', as: 'update_movie'

  destroy 'movies/:id/delete' => 'movies#delete', as: 'delete_movie'

  get 'movies/show_all' => 'movies#show_all', as: 'show_all_movies'

  patch 'movies/:id/upvote' => 'movies#upvote', as: 'upvote_movie'

  get 'albums/index' => 'albums#index', as: 'index_albums'

  get 'albums/new' => 'albums#new', as: 'new_album'

  post 'albums/create' => 'albums#create', as: 'create_album'

  get 'albums/show/:id' => 'albums#show', as: 'show_album'

  get 'albums/:id/edit' => 'albums#edit', as: 'edit_album'

  put 'albums/:id/update' => 'albums#update', as: 'update_album'

  get 'albums/:id/delete' => 'albums#delete', as: 'delete_album'

  get 'albums/show_all' => 'albums#show_all', as: 'show_all_albums'

  get 'albums/:id/upvote' => 'albums#upvote', as: 'upvote_album'

  get 'books/index' => 'books#index', as: 'index_books'

  get 'books/new' => 'books#new', as: 'new_book'

  post 'books/create' => 'books#create', as: 'create_book'

  get 'books/show/:id' => 'books#show', as: 'show_book'

  get 'books/:id/edit' => 'books#edit', as: 'edit_book'

  get 'books/:id/update' => 'books#update', as: 'update_book'

  get 'books/:id/delete' => 'books#delete', as: 'delete_book'

  get 'books/show_all' => 'books#show_all', as: 'show_all_books'

  get 'books/:id/upvote' => 'books#upvote', as: 'upvote_book'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
