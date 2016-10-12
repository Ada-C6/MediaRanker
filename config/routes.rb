Rails.application.routes.draw do

  root 'media#index'
  get '/media' => 'media#index'



  get '/movies' => 'movies#index'
  get '/movies/new' => 'movies#new'
  post 'movies/new' => 'movies#create'
  get '/movies/:id', to: 'movies#show', as: 'show_movie'
  get '/movies/:id/edit', to: 'movies#edit', as: 'edit_movie'
  patch '/movies/:id' => 'movies#update'
  patch '/movies/:id/vote', to: 'movies#vote', as: 'vote_movie'
  delete '/movies/:id', to: 'movies#destroy', as: 'delete_movie'

  get '/books' => 'books#index'
  get '/books/new' => 'books#new'
  post 'books/new' => 'books#create'
  get '/books/:id', to: 'books#show', as: 'show_book'
  get '/books/:id/edit', to: 'books#edit', as: 'edit_book'
  patch '/books/:id' => 'books#update'
  patch '/books/:id/vote', to: 'books#vote', as: 'vote_book'
  delete '/books/:id', to: 'books#destroy', as: 'delete_book'

  get '/albums' => 'albums#index'
  get '/albums/new' => 'albums#new'
  post 'albums/new' => 'albums#create'
  get '/albums/:id', to: 'albums#show', as: 'show_album'
  get '/albums/:id/edit', to: 'albums#edit', as: 'edit_album'
  patch '/albums/:id' => 'albums#update'
  patch '/albums/:id/vote', to: 'albums#vote', as: 'vote_album'
  delete '/albums/:id', to: 'albums#destroy', as: 'delete_album'


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
