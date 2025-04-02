Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions"
  }
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :admin do
    get 'dashboard', to: 'dashboards#index'
    resources :users, except: [:show, :new, :create]
    resources :products, except: [:show]
  end
  
  root "home#index"
end
