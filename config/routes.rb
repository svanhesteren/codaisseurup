Rails.application.routes.draw do
  resources :themes
  # get 'pages/home'
  root to: 'pages#home'

  devise_for :users

  resources :users, only: [:show]
  resources :events, except: [:destroy]
  resources :profiles, only: [:new, :edit, :create, :update]
  resources :photos
  get "about" => "pages#about"
  get "terms" => "pages#terms"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :events do
      resources :registrations, only: [:create, :update, :destroy]
    end
  end

end
