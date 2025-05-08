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

  resource :carts, only: [:show] do
    post 'add/:product_id', to: 'carts#add', as: 'add'
    delete 'remove/:product_id', to: 'carts#remove', as: 'remove'
  end
  resources :cart_items, only: [:create, :update, :destroy]
  resources :orders, only: [:index, :new, :create, :show]

  get 'create_checkout_session', to: 'payments#create_checkout_session'
  post 'create_checkout_session', to: 'payments#create_checkout_session'
  get 'orders/:id/success', to: 'orders#success', as: 'order_success'
  get 'orders/:id/cancel', to: 'orders#cancel', as: 'order_cancel'
  post 'webhooks/stripe', to: 'webhooks#stripe'

  root "home#index"
end
