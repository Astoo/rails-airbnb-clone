Rails.application.routes.draw do
  resources :bookings
  resources :users
  resources :friends do
    resources :reviews
  end

  devise_for :users
  root to: 'friends#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
