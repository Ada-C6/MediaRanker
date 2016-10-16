Rails.application.routes.draw do
  root 'application#index'

  resources :movies
  resources :books
  resources :albums

end
