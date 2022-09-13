Rails.application.routes.draw do
  get 'home/index'
  devise_scope :user do
    get "users", to: "devise/sessions#new"
  end

  devise_for :users

  root to: 'home#index'
end
