Rails.application.routes.draw do
  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Authentication
  get "/login", to: "sessions#new", as: :login
  get "/logout", to: "sessions#destroy", as: :logout
  get "/auth/:provider/callback", to: "sessions#create"
  get "/auth/failure", to: "sessions#failure"

  # Main resources
  resources :tracks, only: [:index, :show] do
    member do
      post :start
    end
  end

  resources :lessons, only: [:show] do
    member do
      post :start
      get :complete
      post :complete, action: :complete, as: nil
    end
    resources :exercises, only: [:show] do
      member do
        post :answer
      end
    end
  end

  # Gamification
  resource :profile, only: [:show, :edit, :update]
  resources :leaderboard, only: [:index]
  resources :achievements, only: [:index]
  resources :missions, only: [:index] do
    member do
      post :claim
    end
  end
  resources :shop, only: [:index] do
    collection do
      post :buy_streak_freeze
      post :buy_lives
    end
  end

  # Spaced repetition
  resources :reviews, only: [:index, :show] do
    member do
      post :answer
    end
  end

  root "tracks#index"
end
