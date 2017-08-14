Rails.application.routes.draw do
  get 'friends/show'

  get 'friends/new'

  get 'users/show'

  get 'users/update'

  get 'users/new'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
