Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "categories#index"
  resources :categories
  # get 'categories' => 'categories#index'
  # get '/categories/new' => 'categories#new'
  # get '/categories/:id' => 'categories#show'
  # post 'categories' => 'categories#create'
end
