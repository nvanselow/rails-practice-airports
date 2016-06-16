Rails.application.routes.draw do
  root "airports#index"
  
  resources :airports, only: [:index, :show, :new, :create]
end
