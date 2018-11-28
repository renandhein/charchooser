Rails.application.routes.draw do
  # Entry point
  authenticated :user do
    root :to => 'characters#index'
  end
  root to: 'landing#index'

  devise_for :users

  resources :characters, only: :index
end
