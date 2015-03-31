Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'questions#index'

  resources :questions do
    resources :answers, only: [:create] do
      member do
        resources :likes, only: [:create], to: "answers#like"
        resources :accepts, only: [:create], to: "answers#accept"
      end
    end
  end

  resources :users, only: [:show]
end
