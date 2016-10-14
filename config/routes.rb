Rails.application.routes.draw do
  root 'homepage#index'
  
  resources :movies
  resources :albums
  resources :books
end
