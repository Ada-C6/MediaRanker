Rails.application.routes.draw do
  root 'mainpages#index'
  get '/index' => 'mainpages#index'

  resources :movies do
    patch 'upvote'
  end

  resources :albums do
    patch 'upvote'
  end

  resources :books do
    patch 'upvote'
  end
end
