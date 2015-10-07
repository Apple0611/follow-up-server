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
  devise_for :users, path: 'auth', path_names: {
    sign_in: 'signin',
    sign_out: 'signout',
    registration: 'signup',
  }, controllers: {
    registrations: :registrations,
    passwords: :passwords,
    sessions: :sessions
  }

  # settings
  get 'settings', to: 'settings#index'

  # treatments
  resources :treatments
end
