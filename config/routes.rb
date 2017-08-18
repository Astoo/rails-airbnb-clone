Rails.application.routes.draw do
  #get 'accounts/show'
  post 'accept_booking', to: 'bookings#accept_booking'
  post 'reject_booking', to: 'bookings#reject_booking'


  resources :friends, except: :edit do
    resources :reviews, only: :create
    resources :bookings, only: [:new, :show, :destroy, :create, :update]
  end


  resources :accounts, only: :show do
    resources :friends, only: [:new]
  end

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
