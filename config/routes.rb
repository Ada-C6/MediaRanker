Rails.application.routes.draw do
  root 'mainpages#index'
  resources :movies
  resources :albums
  resources :books
end
