Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails do
    resources :doses, only: [:index, :new, :create]
  end
  resources :doses, only: [:destroy]
  # resources :ingredients
  resources :users, only: [:show]

  resources :favorites, only: [:index, :new, :create, :destroy]

  root to: "cocktails#index"

  # get "favorites_controller/:cocktail_id" => "favorites#create", :as => :favorite
end
