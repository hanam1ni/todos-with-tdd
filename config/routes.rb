Rails.application.routes.draw do
  resources :todos, only: [:index, :new, :create]
  resource :session, only: [:new, :create]
  root to: 'todos#index'
end
