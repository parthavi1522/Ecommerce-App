Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions"
  }
  get "up" => "rails/health#show", as: :rails_health_check

  authenticated :user do
    authenticate :user, ->(u) { u.admin? } do
      namespace :admin do
        get 'dashboard', to: 'dashboards#index'
        resources :users, except: [:show, :new, :create]
      end
    end
  end
  
  root "home#index"
end
