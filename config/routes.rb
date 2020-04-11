Rails.application.routes.draw do
  devise_for :doctors, controllers: {
    # sessions: 'users/sessions',
    registrations: 'doctors/registrations',
  }
  devise_for :patients, controllers: {
    # sessions: 'users/sessions',
    registrations: 'patients/registrations',
  }
  resources :users
  resources :solutions
  resources :cases
  resources :dashboards
  root to: 'dashboards#show'
end
