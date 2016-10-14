Rails.application.routes.draw do

  root 'home#index'

  get 'home/index' => 'home#index', as: 'home'

  #############################################

  get 'wizards/index' => 'wizards#index', as: 'wizard'

  get 'wizards/show/:id' => 'wizards#show', as: 'show_wizard'

  get 'wizards/new' => 'wizards#new', as: 'new_wizard'

  post 'wizards/create' => 'wizards#create', as: 'create_wizard'

  get 'wizards/:id/edit' => 'wizards#edit', as: 'edit_wizard'

  patch 'wizards/:id/update' => 'wizards#update', as: 'update_wizard'

  delete 'wizards/:id/delete' => 'wizards#delete', as: 'delete_wizard'

  post 'wizards/:id/upvote' => 'wizards#upvote', as: 'upvote_wizard'

  #############################################

  get 'leslies/index' => 'leslies#index', as: 'leslie'

  get 'leslies/show/:id' => 'leslies#show', as: 'show_leslie'

  get 'leslies/new' => 'leslies#new', as: 'new_leslie'

  post 'leslies/create' => 'leslies#create', as: 'create_leslie'

  get 'leslies/:id/edit' => 'leslies#edit', as: 'edit_leslie'

  patch 'leslies/:id/update' => 'leslies#update', as: 'update_leslie'

  delete 'leslies/:id/delete' => 'leslies#delete', as: 'delete_leslie'

  post 'leslies/:id/upvote' => 'leslies#upvote', as: 'upvote_leslie'

  #############################################

  get 'bobs/index' => 'bobs#index', as: 'bob'

  get 'bobs/show/:id' => 'bobs#show', as: 'show_bob'

  get 'bobs/new' => 'bobs#new', as: 'new_bob'

  post 'bobs/create' => 'bobs#create', as: 'create_bob'

  get 'bobs/:id/edit' => 'bobs#edit', as: 'edit_bob'

  patch 'bobs/:id/update' => 'bobs#update', as: 'update_bob'

  delete 'bobs/:id/delete' => 'bobs#delete', as: 'delete_bob'

  post 'bobs/:id/upvote' => 'bobs#upvote', as: 'upvote_bob'

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
