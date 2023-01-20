Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/admin/sign_in' => 'devise/sessions#new'
    get '/login' => 'devise/sessions#new', as: :login
    unauthenticated do
      root to: 'home#index', as: 'unauthenticated_root'
    end
  end

  authenticated :user do
    root to: 'base#index'
  end

  namespace :admin do 
    resources :restaurants
  end

  namespace :restaurant do
    resources :ingredients
    resources :categories
  end
end
