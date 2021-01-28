Rails.application.routes.draw do
  resources :flights
  resources :bookings, only: [:new, :show, :create, :destroy]
  resources :airports
  resources :passengers, only:[:new, :create, :destroy]

  root 'flights#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
