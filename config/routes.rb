Rails.application.routes.draw do
  namespace :admin do
    resources :posts
    resources :tags
  end

  resources :users, only: [:new, :create, :show, :delete] do
    resources :posts, only: [:index, :edit, :update, :show ]
    resources :tags, only: [:new, :create]
  end

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"

end
