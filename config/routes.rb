Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#main"
  resources :categories do
    resources :tasks
  end

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/user/edit-profile' => 'devise/registration#edit'
  end

  get 'due-today' => 'tasks#due_today'

  # get 'categories' => 'categories#index'
  # get '/categories/new' => 'categories#new'
  # get '/categories/:id' => 'categories#show'
  # post 'categories' => 'categories#create'
end
