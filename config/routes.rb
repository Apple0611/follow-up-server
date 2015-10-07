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
    registrations: :registrations,
    passwords: :passwords,
    sessions: :sessions
  }
  devise_scope :user do
    get '/signin', to: 'sessions#new'
    get '/signout', to: 'sessions#destroy'
    get '/signup', to: 'registrations#new'
  end

  # settings
  get 'settings', to: 'settings#index'

  # treatments
  resources :treatments
end
