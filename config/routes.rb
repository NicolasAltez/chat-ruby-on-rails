Rails.application.routes.draw do
  resources :messages, only: [:index, :create, :new]
  root to: 'messages#index'
end
