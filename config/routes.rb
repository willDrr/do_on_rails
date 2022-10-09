Rails.application.routes.draw do
  get 'home/index'
  devise_scope :user do
    get "users", to: "devise/sessions#new"
  end

  # devise_for :users
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root to: 'home#index'
end
