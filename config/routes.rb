Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: "login", sign_out: "logout", sign_up: 'register'}
  resources :portfolios, except: [:show]
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  root 'pages#home'

  get 'about', to: 'pages#about'
  get 'contact', to:  'pages#contact'

#  get 'blog/:id/toggler', to: 'blogs#toggler', as: "togler-status"

  resources :blogs do
    member do
      get :toggle_status
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
