Rails.application.routes.draw do
  root to: 'media#index', as: 'index'

  get 'media/:type/index' => 'media#index'

  get 'media/:type/all' => 'media#all', as: 'media_all'

  get 'media/:id/show' => 'media#show', as: 'medium_show'

  get 'media/:type/new' => 'media#new', as: 'medium_new'

  post 'media/:type/create' => 'media#create', as: 'medium_create'

  get 'media/:id/edit' => 'media#edit', as: 'medium_edit'

  patch 'media/:id/update' => 'media#update', as: 'medium_update'

  delete 'media/:id/delete' => 'media#delete', as: 'medium_delete'

  get 'media/:id/upvote' => 'media#upvote', as: 'medium_upvote'

  # get 'movies/all' => 'movies#all', as: 'all'
  #
  # get 'movies/:id' => 'movies#show', as: 'show'
  #
  # get 'movies/:id/edit' => 'movies#edit', as: 'edit'
  #
  # patch 'movies/:id/update' => 'movies#update', as: 'update'
  #
  # delete 'movies/:id/delete' => 'movies#delete', as: 'delete'
  #
  # get 'movies/:id/upvote' => 'movies#upvote', as: 'upvote'


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
