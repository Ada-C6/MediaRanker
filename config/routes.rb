Rails.application.routes.draw do

  root to: 'mains#index'

  # Front page

  get 'main' => 'mains#index', as: 'main'

  # Album-specific

  get 'albums/index'

  get 'albums/show/:id' => 'albums#show', as: 'albums_show'

  get 'albums/new'

  post 'albums/create'

  get 'albums/:id/edit' => 'albums#edit', as: 'albums_edit'

  put 'albums/:id/update' => 'albums#update', as: 'albums_update'

  patch 'albums/:id/update' => 'albums#update', as: 'albums_upvote'

  delete 'albums/:id/destroy' => 'albums#destroy', as: 'albums_destroy'

  # Book-specific

  get 'books/index'

  get 'books/show/:id' => 'books#show', as: 'books_show'

  get 'books/new'

  post 'books/create'

  get 'books/:id/edit' => 'books#edit', as: 'books_edit'

  put 'books/:id/update' => 'books#update', as: 'books_update'

  patch 'books/:id/update' => 'books#update', as: 'books_upvote'

  delete 'books/:id/destroy' => 'books#destroy', as: 'books_destroy'

  # Movie-specific

  get 'movies/index'

  get 'movies/show/:id' => 'movies#show', as: 'movies_show'

  get 'movies/new'

  post 'movies/create'

  get 'movies/:id/edit' => 'movies#edit', as: 'movies_edit'

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
