Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :users, only: [:index,:edit, :update,]
  resources :groups, only: [:new, :create, :edit, :update,] do
    resources :tasks, only: [:index, :create, :destroy]
    resources :users, only: [:show, :destroy] do
      resources :tasks, only: [:destroy]
    end  
      namespace :api do
        resources :tasks, only: :index, defaults: {format: 'json'}
      end  
  end
end  
