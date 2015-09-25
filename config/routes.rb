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
  resources :users
  # match 'signup', to: 'users#create', via: [:get, :post]

  # identities
  get 'auth/identity/register', to: 'identities#new'
  resources :identities

  # sessions
  resources :sessions
  get 'auth/identity/signin', to: 'sessions#new'
  post 'auth/identity/signin', to: 'sessions#create'
  post 'auth/identity/callback', to: 'sessions#create'
  get 'auth/identity/signout', to: 'sessions#destroy'

  # settings
  get 'settings', to: 'settings#index'

  resources :treatments

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
