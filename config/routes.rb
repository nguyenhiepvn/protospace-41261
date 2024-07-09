Rails.application.routes.draw do
  devise_for :users
  get 'users/:id/prototype', to: 'user#show', as: :usershowprototype
  root to: "prototypes#index"
  resources :prototypes
  
end