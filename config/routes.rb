Rails.application.routes.draw do
  
  root to: 'events#index'

  get 'events/index' 
  get 'events/new'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events, only: [:create] do
    resources :pictures, only: [:create]
  end
end