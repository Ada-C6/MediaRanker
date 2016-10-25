Rails.application.routes.draw do
  resources :movies
# get "/movies" => "movies#index", as: :movies
# post "/movies" => "movies#create"
# get "/movies/:id" => "movies#show", as: :movie
# patch "/movies/:id" => "movies#update"
# put "/movies/:id" => "movies#upate"
# delete "/movies/:id" => "movies#destroy"
# get "/movies/new" => "movies#new", as: :new_movie
# get "/movies/:id/edit" => "movies#edit", as: :edit_movie
  patch "movies/:id/upvote" => "movies#upvote", as: :movies_upvote

  resources :books
# get "/books" => "books#index", as: :books
# post "/books" => "books#create"
# get "/books/:id" => "books#show", as: :book
# patch "/books/:id" => "books#update"
# put "/books/:id" => "books#upate"
# delete "/books/:id" => "books#destroy"
# get "/books/new" => "books#new", as: :new_book
# get "/books/:id/edit" => "books#edit", as: :edit_book
  patch "books/:id/upvote" => "books#upvote", as: :books_upvote

  resources :albums
  # get "/albums" => "albums#index", as: :albums
  # post "/albums" => "albums#create"
  # get "/albums/:id" => "albums#show", as: :album
  # patch "/albums/:id" => "albums#update"
  # put "/albums/:id" => "albums#upate"
  # delete "/albums/:id" => "albums#destroy"
  # get "/albums/new" => "albums#new", as: :new_albym
  # get "/albums/:id/edit" => "albums#edit", as: :edit_album
  patch "albums/:id/upvote" => "albums#upvote", as: :albums_upvote
  # I was orignally going to not include all of the resource functionality. Yet, because I know another wave is coming with potential web auth. I have chosen to include this.
  resources :users

  # get "/users" => "users#index", as: :users
  # post "/users" => "users#create"
  # get "/users/:id" => "users#show", as: :user
  # patch "/users/:id" => "users#update"
  # put "/users/:id" => "users#upate"
  # delete "/users/:id" => "users#destroy"
  # get "/users/new" => "users#new", as: :new_user
  # get "/users/:id/edit" => "users#edit", as: :edit_user

end


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
