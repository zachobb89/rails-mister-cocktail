Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [:show, :new, :create] do
    resources :doses, only: [:index, :new, :create]
  end
  resources :doses, only: [:destroy]
  # resources :ingredients

  root to: "cocktails#index"
end
