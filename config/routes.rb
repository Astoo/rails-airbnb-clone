Rails.application.routes.draw do
  resources :friends do
    resources :reviews
    resources :bookings
  end
  resources :reviews
  resources :bookings

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
