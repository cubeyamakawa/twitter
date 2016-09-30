Rails.application.routes.draw do

  
  resources :registrations, only: [:new, :create]
  resource :sessions, only: [:new, :create, :destroy]
  resource :settings, only: [:edit, :update]

  resources :users, only: [:index, :show] do
      resource :follow, only: [:create, :destroy]
      get :favorites, on: :member
      get :follows, on: :member
      get :followers, on: :member
  end

  resources :tweets do
  	resource :favorites, only: [:create, :destroy]
  end

  root to: 'registrations#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
