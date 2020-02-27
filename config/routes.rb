Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :users, only: [:edit, :update, :show]
  resources :groups, only: [:new, :create, :edit, :update ] do
    resources :tasks, only: [:index, :create, :destroy]
    resources :users, only: [:show]
  end
end  
