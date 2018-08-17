Rails.application.routes.draw do
  resources :todos, only: [:index, :new, :create] do
    resource :completion, only: :create
  end

  resource :session, only: [:new, :create]
  root to: 'todos#index'
end
