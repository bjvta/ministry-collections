Rails.application.routes.draw do
  get 'home/index'
  get 'home/debts'
  root 'home#index'
  resources :member_weekly_collections
  resources :fines
  resources :expenses
  resources :weekly_collections
  resources :fee_types
  resources :members
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  post 'pay_member_weekly_collection', to: 'members#pay_weekly_collection'
  post 'pay_member_fine', to: 'members#pay_fine'
  get 'backups/new', to: 'backups#new', as: 'new_backup'
  post 'backups/create', to: 'backups#create', as: 'create_backup'
end
