Rails.application.routes.draw do
  devise_for :users

  root to: 'questions#index'

  resources :questions do
    resources :answers, only: [:create] do
      member do
        resources :likes, only: [:create]
      end
    end
  end

  resources :users, only: [:show]
end
