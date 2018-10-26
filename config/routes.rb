Rails.application.routes.draw do
  resources :gardens do
    resources :plants, only: :create
  end

  resources :plants, only: :destroy do
    # resources :plant_tags, only: [:new, :create] # < ----- Same deal as bellow
    resources :plant_tags, only: %i[new create]
  end

  root to: 'gardens#index'
end
