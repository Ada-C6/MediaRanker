Rails.application.routes.draw do

    root 'home#index'
    resources :home, only: [:index]

    resources :albums

    resources :books

    resources :movies
end
