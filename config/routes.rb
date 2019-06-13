Rails.application.routes.draw do
  resources :sessionistes
  resources :paroises
  resources :sessionistes_imports, only: [:new, :create]
  devise_for :users
  root 'sessionistes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
