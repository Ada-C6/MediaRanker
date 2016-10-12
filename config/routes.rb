Rails.application.routes.draw do

  root to: 'mains#index'

  # Front page

  get 'main' => 'mains#index', as: 'main'

  # Album-specific

  get 'albums/index'

  get 'albums/show/:id' => 'albums#show', as: 'albums_show'

  get 'albums/new'

  post 'albums/create'

  get 'albums/create' => 'albums#new' # For refresh of mis-completed form

  get 'albums/:id/edit' => 'albums#edit', as: 'albums_edit'

  put 'albums/:id/update' => 'albums#update', as: 'albums_update'

  get 'albums/:id/update' => 'albums#edit' # For refresh of mis-completed form

  patch 'albums/:id/update' => 'albums#update', as: 'albums_upvote'

  delete 'albums/:id/destroy' => 'albums#destroy', as: 'albums_destroy'

  # Book-specific

  get 'books/index'

  get 'books/show/:id' => 'books#show', as: 'books_show'

  get 'books/new'

  post 'books/create'

  get 'books/create' => 'books#new' # For refresh of mis-completed form

  get 'books/:id/edit' => 'books#edit', as: 'books_edit'

  put 'books/:id/update' => 'books#update', as: 'books_update'

  get 'books/:id/update' => 'books#edit' # For refresh of mis-completed form

  patch 'books/:id/update' => 'books#update', as: 'books_upvote'

  delete 'books/:id/destroy' => 'books#destroy', as: 'books_destroy'

  # Movie-specific

  get 'movies/index'

  get 'movies/show/:id' => 'movies#show', as: 'movies_show'

  get 'movies/new'

  get 'movies/create' => 'movies#new' # For refresh of mis-completed form

  post 'movies/create'

  get 'movies/:id/edit' => 'movies#edit', as: 'movies_edit'

  get 'movies/:id/update' => 'movies#edit' # For refresh of mis-completed form

  put 'movies/:id/update' => 'movies#update', as: 'movies_update'

  patch 'movies/:id/update' => 'movies#update', as: 'movies_upvote'

  delete 'movies/:id/destroy' => 'movies#destroy', as: 'movies_destroy'

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
