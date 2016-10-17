Rails.application.routes.draw do
  root 'main#index'
  get '/main/index' => 'main#index'

  get '/movies' => 'movies#index'
  get '/movies/new', to: 'movies#new', as: 'new_movie'
  post '/movies' => 'movies#create'
  get '/movies/:id/edit', to: "movies#edit", as: 'edit_movie'
  patch 'movies/:id' => 'movies#update'
  get '/movies/:id', to: 'movies#show', as: 'movie'
  patch '/movies/:id/upvote', to: 'movies#upvote', as: 'upvote_movie'
  delete '/movies/:id', to: 'movies#destroy', as: 'delete_movie'

  get '/books' => 'books#index'
  get '/books/new', to: 'books#new', as: 'new_book'
  post '/books' => 'books#create'
  get '/books/:id/edit', to: 'books#edit', as: 'edit_book'
  patch '/books/:id' => 'books#update'
  get '/books/:id', to: 'books#show', as: 'book'
  patch '/books/:id/upvote', to: 'books#upvote', as: 'upvote_book'
  delete '/books/:id', to: 'books#destroy', as: 'delete_book'

  get '/albums' => 'albums#index'
  get '/albums/new', to: 'albums#new', as: 'new_album'
  post '/albums' => 'albums#create'
  get '/albums/:id/edit', to: 'albums#edit', as: 'edit_album'
  patch '/albums/:id' => 'albums#update'
  get '/albums/:id', to: 'albums#show', as: 'album'
  patch '/albums/:id/upvote', to: 'albums#upvote', as: 'upvote_album'
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
