Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update, :show] do
    resources :items
  end

  authenticated :user do
    root to: "users#show", as: :authenticated_root, via: :get
  end

 get 'welcome/about'

  unauthenticated do
    root to: 'welcome#index'
  end
end
