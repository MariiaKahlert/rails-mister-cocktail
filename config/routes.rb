  Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :cocktails, except: %i[edit update] do
    resources :doses, only: %i[new create]
  end
  resources :doses, only: [:destroy]
end
