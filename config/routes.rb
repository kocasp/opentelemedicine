Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  resources :users
  resources :solutions
  resources :cases
  resources :dashboards
  root to: 'dashboards#show'
end
