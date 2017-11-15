Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:update, :show]

  authenticated :user do
    root to: "users#show", as: :authenticated_root, via: :get
  end

 get 'welcome/about'

  unauthenticated do
    root to: 'welcome#index'
  end
end
