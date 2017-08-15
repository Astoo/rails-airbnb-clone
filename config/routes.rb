Rails.application.routes.draw do
  resources :friends do
    resources :reviews
    resources :bookings
  end
  resources :reviews
  resources :bookings

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
