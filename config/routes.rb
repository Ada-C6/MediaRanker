Rails.application.routes.draw do
  root to: 'homepage#index'

  get 'books/index' => 'books#index', as: 'booksindex'

  get 'books/:id/show' => 'books#show', as: 'booksshow'

  get 'books/:id/edit' => 'books#edit', as: 'booksedit'

  patch 'books/:id/update' => 'books#update', as: 'booksupdate'

  get 'books/new' => 'books#new', as: 'booksnew'

  post 'books/create' => 'books#create', as: 'bookscreate'

  post 'books/:id/upvote' => 'books#upvote', as: 'booksupvote'

  delete 'books/:id/destroy' => 'books#destroy', as: 'booksdestroy'


  get 'capstone/index' => 'capstone#index', as: 'capstoneindex'

  get 'capstone/:id/show' => 'capstone#show', as: 'capstoneshow'

  get 'capstone/:id/edit' => 'capstone#edit', as: 'capstoneedit'

  patch 'capstone/:id/update' => 'capstone#update', as: 'capstoneupdate'

  get 'capstone/new' => 'capstone#new', as: 'capstonenew'

  post 'capstone/create' => 'capstone#create', as: 'capstonecreate'

  post 'capstone/:id/upvote' => 'capstone#upvote', as: 'capstoneupvote'

  delete 'capstone/:id/destroy' => 'capstone#destroy', as: 'capstonedestroy'


  get 'netflix/index' => 'netflix#index', as: 'netflixindex'

  get 'netflix/:id/show' => 'netflix#show', as: 'netflixshow'

  get 'netflix/:id/edit' => 'netflix#edit', as: 'netflixedit'

  patch 'netflix/:id/update' => 'netflix#update', as: 'netflixupdate'

  get 'netflix/new' => 'netflix#new', as: 'netflixnew'

  post 'netflix/create' => 'netflix#create', as: 'netflixcreate'

  post 'netflix/:id/upvote' => 'netflix#upvote', as: 'netflixupvote'

  delete 'netflix/:id/destroy' => 'netflix#destroy', as: 'netflixdestroy'


  get 'homepage/index', as: 'homepageindex'

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
