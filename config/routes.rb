Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts
  # get '/posts', to: 'posts#index'
  # get '/posts/:id', to: 'posts#show'
  # get '/posts/new', to: 'posts#new'
  # get '/posts/:id/edit', to: 'posts#edit'
  # post '/posts/:id', to: 'posts#create'
  # put '/posts/:id', to: 'posts#update'
  # put '/posts/:id', to: 'posts#update'

  namespace :api do 
    resources :posts, defaults: { format: 'json' }
    resources :posts do 
      resources :comments, only: [:index, :show] #, controller: ''
    end
  end
end
