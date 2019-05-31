Rails.application.routes.draw do
  root to: 'gardens#index'

  resources :gardens do
    resources :plants, only: :create
  end

  resources :plants, only: :destroy do
    resources :taggings, only: [:new, :create]
  end
end
