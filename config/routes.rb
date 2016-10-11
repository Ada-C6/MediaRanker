Rails.application.routes.draw do
  get 'movies/index' => 'movies#index', as: 'index_movies'

  get 'movies/new' => 'movies#new', as: 'new_movie'

  get 'movies/create' => 'movies#create', as: 'create_movie'

  get 'movies/show/:id' => 'movies#show', as: 'show_movie'

  get 'movies/:id/edit' => 'movies#edit', as: 'edit_movie'

  get 'movies/:id/update' => 'movies#update', as: 'update_movie'

  get 'movies/:id/delete' => 'movies#delete', as: 'delete_movie'

  get 'movies/show_all' => 'movies#show_all', as: 'show_all_movies'

  get 'movies/:id/upvote' => 'movies#upvote', as: 'upvote_movie'

  get 'albums/index'

  get 'albums/new'

  get 'albums/create'

  get 'albums/show'

  get 'albums/edit'

  get 'albums/update'

  get 'albums/delete'

  get 'albums/show_all'

  get 'albums/upvote'

  get 'books/index'

  get 'books/new'

  get 'books/create'

  get 'books/show'

  get 'books/edit'

  get 'books/update'

  get 'books/delete'

  get 'books/show_all'

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
