Rails.application.routes.draw do
  resources :rounds
  resources :players
  root 'rounds#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
