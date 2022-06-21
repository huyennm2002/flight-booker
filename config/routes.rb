Rails.application.routes.draw do
  get 'bookings/index'
  get 'booking/index'
  get 'flights', to: 'flights#search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "flights#index"
  resources :flights
  resources :bookings
  
end
