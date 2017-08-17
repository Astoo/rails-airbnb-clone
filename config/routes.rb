Rails.application.routes.draw do
  get 'accounts/show'

  resources :friends, except: :edit do
    resources :reviews, only: :create
    resources :bookings, only: [:new, :show, :destroy, :create, :update]
  end

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
