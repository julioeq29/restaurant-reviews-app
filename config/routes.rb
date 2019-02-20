Rails.application.routes.draw do
  namespace :admin do
    get 'restaurants/index'
  end
  resources :restaurants do
    collection do #restaurants
      get "top", to: "restaurants#top"
    end
    member do #restaurants/:id
      get "chef", to: "restaurants#chef"
    end
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [ :show, :edit, :update, :destroy ]
  namespace :admin do
    resources :restaurants, only: [:index] #admin/restaurants
  end
end
