Rails.application.routes.draw do

  root 'homes#index'

  get 'homes/index'

  get 'movies/index' => 'movies#index', as: 'movie_index'

  get 'movies/show/:id' => 'movies#show', as: 'movie_show'

  get 'movies/new' => 'movies#new', as: 'movie_new'

  post 'movies/create' => 'movies#create', as: 'movie_create'

  get 'movies/:id/edit' => 'movies#edit', as: 'movie_edit'

  put 'movies/:id/update' => 'movies#update', as: 'movie_update'

  delete 'movies/:id/destroy' => 'movies#destroy', as: 'movie_delete'

  get 'movies/upvote'

  get 'albums/index' => 'albums#index', as: 'album_index'

  get 'albums/show/:id' => 'albums#show', as: 'album_show'

  get 'albums/new' => 'albums#new', as: 'album_new'

  post 'albums/create' => 'albums#create', as: 'album_create'

  get 'albums/:id/edit' => 'albums#edit', as: 'album_edit'

  put 'albums/:id/update' => 'albums#update', as: 'album_update'

  delete 'albums/:id/destroy' => 'albums#destroy', as: 'album_delete'

  get 'albums/upvote'

  get 'books/index' => 'books#index', as: 'book_index'

  get 'books/show/:id' => 'books#show', as: 'book_show'

  get 'books/new' => 'books#new', as: 'book_new'

  post 'books/create' => 'books#create', as: 'book_create'

  get 'books/:id/edit' => 'books#edit', as: 'book_edit'

  put 'books/:id/update' => 'books#update', as: 'book_update'

  delete 'books/:id/destroy' => 'books#destroy', as: 'book_delete'

  get 'books/upvote'

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
