Rails.application.routes.draw do
  root to: 'homepages#index'
  get 'homepages/index', as: 'index'

  get 'movies/index' => 'movies#index', as: 'index_movies'

  get 'movies/show/:id' => 'movies#show', as: 'show_movies'

  get 'movies/new' => 'movies#new', as: 'new_movies'

  post 'movies/create' => 'movies#create', as:'create_movies'

  get 'movies/:id/edit' => 'movies#edit', as: 'edit_movies'

  patch 'movies/:id/update' => 'movies#update', as: 'update_movies'

  patch 'movies/:id/upvote' => 'movies#upvote', as: 'upvote_movies'

  delete 'movies/:id/destroy' => 'movies#destroy', as: 'delete_movies'

  get 'books/index' => 'books#index', as: 'index_books'

  get 'books/show/:id' => 'books#show', as: 'show_books'

  get 'books/new' => 'books#new', as: 'new_books'

  post 'books/create' => 'books#create', as: 'create_books'

  get 'books/:id/edit' => 'books#edit', as: 'edit_books'

  patch 'books/:id/update' => 'books#update', as: 'update_books'

  patch 'books/:id/upvote' => 'books#upvote', as: 'upvote_books'

  delete 'books/:id/destroy' => 'books#destroy', as: 'delete_books'

  get 'albums/index' => 'albums#index', as: 'index_albums'

  get 'albums/show/:id' => 'albums#show', as: 'show_albums'

  get 'albums/new' => 'albums#new', as: 'new_albums'

  post 'albums/create' => 'albums#create', as: 'create_albums'

  get 'albums/:id/edit' => 'albums#edit', as: 'edit_albums'

  patch 'albums/:id/update' => 'albums#update', as: 'update_albums'

  patch 'albums/:id/upvote' => 'albums#upvote', as: 'upvote_albums'

  delete 'albums/:id/destroy' => 'albums#destroy', as: 'delete_albums'

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
