Rails.application.routes.draw do

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :candidates, only: [:new, :create]

  root to: 'candidates#new'

end
