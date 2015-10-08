Rails.application.routes.draw do
  # root
  root 'home#index'

  # home
  get 'home/index'
  get 'search', to: 'home#search'

  # categories
  resources :categories
  get 'categories/by/:by_method', to: 'categories#index'
  # post 'categories/select', to: 'categories#select'

  # department
  get 'departments/:id/new', to: 'departments#new', as: 'new_deparment'
  resources :departments

  # diseases
  resources :diseases
  get 'diseases/:id/page/:page', to: 'diseases#show'

  # users
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    sessions: 'users/sessions',
  }
  devise_scope :user do
    get '/signin', to: 'users/sessions#new'
    post '/signin', to: 'users/sessions#create'
    get '/signout', to: 'users/sessions#destroy'
    get '/signup', to: 'users/registrations#new'
    post '/signup', to: 'users/registrations#create'
  end

  # settings
  get 'settings', to: 'settings#index'

  # treatments
  resources :treatments
end
