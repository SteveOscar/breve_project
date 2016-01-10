Rails.application.routes.draw do
  namespace :admin do
    resources :posts
    resources :tags
  end

  resources :users, only: [:new, :create, :show, :delete] do
    resources :posts
    resources :tags, only: [:new, :create]
  end

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  root 'users#new'
end
