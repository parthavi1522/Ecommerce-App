Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: 'users/registrations'
  }
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :admin do
    get 'dashboard', to: 'dashboards#index'
    resources :users, except: [:show, :new, :create]
    resources :products, except: [:show]
    resources :orders, except: [:show, :new, :create]
    resources :feedbacks, only: [:index]
  end

  resources :feedbacks, only: [:create]
  get 'feedbacks', to: 'feedbacks#new'
  get 'contact', to: 'pages#contact'
  post 'contact', to: 'pages#create_contact'
  get 'about', to: 'pages#about'

  get 'customer_dashboard', to: 'customer_dashboards#index'
  resources :profiles, only: [:show, :edit, :update]

  root "home#index"
end
