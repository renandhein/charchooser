Rails.application.routes.draw do
  root to: 'landing#index'

  resources :characters, only: :index  
end
