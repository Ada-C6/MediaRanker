Rails.application.routes.draw do
root to: 'media#index'
  resources :albums
  resources :movies
  resources :books
  resources :media, only: [:index, :show]
  resources :books, :albums, :movies do
  member do
    post 'upvote'
  end
end


#     Prefix Verb   URI Pattern                Controller#Action
#     albums GET    /albums(.:format)          albums#index
#            POST   /albums(.:format)          albums#create
#  new_album GET    /albums/new(.:format)      albums#new
# edit_album GET    /albums/:id/edit(.:format) albums#edit
#      album GET    /albums/:id(.:format)      albums#show
#            PATCH  /albums/:id(.:format)      albums#update
#            PUT    /albums/:id(.:format)      albums#update
#            DELETE /albums/:id(.:format)      albums#destroy
#     movies GET    /movies(.:format)          movies#index
#            POST   /movies(.:format)          movies#create
#  new_movie GET    /movies/new(.:format)      movies#new
# edit_movie GET    /movies/:id/edit(.:format) movies#edit
#      movie GET    /movies/:id(.:format)      movies#show
#            PATCH  /movies/:id(.:format)      movies#update
#            PUT    /movies/:id(.:format)      movies#update
#            DELETE /movies/:id(.:format)      movies#destroy
#      books GET    /books(.:format)           books#index
#            POST   /books(.:format)           books#create
#   new_book GET    /books/new(.:format)       books#new
#  edit_book GET    /books/:id/edit(.:format)  books#edit
#       book GET    /books/:id(.:format)       books#show
#            PATCH  /books/:id(.:format)       books#update
#            PUT    /books/:id(.:format)       books#update
#            DELETE /books/:id(.:format)       books#destroy
#       media GET    /media(.:format)           media#index
#     medium GET    /media/:id(.:format)       media#show
#  upvote_book POST   /books/:id/upvote(.:format) books#upvote

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
