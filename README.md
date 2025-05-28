# Ecommerce-App

Welcome to this step-by-step guide on building a foundational e-commerce application using Ruby on Rails 8.0.2, MySQL as the database, and Importmap for JavaScript management. This guide is tailored for freshers with a basic understanding of Rails, MVC (Model-View-Controller) architecture, and Ruby fundamentals.

You will learn to implement essential e-commerce features like user authentication, product management, a shopping cart (for both guests and logged-in users), checkout, and basic order tracking with Stripe payment integration.

# Project Overview
This project aims to create a simplified e-commerce platform with two main user roles:

Admin: Manages products, users, orders, and feedback.
Customer: Browses products, adds items to cart, manages their profile, places orders (requires login), tracks orders, and provides feedback.
Key Features You Will Implement:

User Authentication (Login, Sign Up, Logout) with roles (Admin/Customer)
Admin Panel for Product, User, Order, and Feedback Management
Customer Dashboard for Product Browse
Shopping Cart (Session-based for Guests, Database-based for Logged-in Users)
Seamless Cart Merging on User Login
Stripe Checkout Integration for Payments
Basic Order Tracking for Customers
User Profile Management
Static Pages (About Us, Contact Us)
Responsive UI using Bootstrap 5 and Font Awesome

# Prerequisites
Before you begin, ensure you have the following installed on your system:

1. Ruby: Version 3.1 or higher (check with ruby -v)
2. Rails: Version 8.0.2 or higher (check with rails -v)
3. MySQL: Database server (ensure it's running and you have a user with appropriate permissions, e.g., root with password).
4. Git: For version control (check with git --version)
5. Stripe Account: For payment gateway integration (sign up at stripe.com)
6. Basic understanding of HTML, CSS, JavaScript.
7. Familiarity with the command line/terminal.

🔐 Admin Login Credentials
# Seeded by default via rails db:seed:
    Email: admin@example.com
    Password: password

## 📁 1) Steps to Create App:
1. Create a new Rails application with MySQL as the database:
   Open your terminal and run:
    rails new ecommerce_app --database=mysql --css=bootstrap
    cd ecommerce_app

2. Install Gems:
    bundle install

3. Initialize a Git repository:
    git init
    echo "/config/master.key" >> .gitignore
    git add .
    git commit -m "Initial Rails 8 project setup"

## 📁 2) Database Configuration:
1. Update database.yml file with your MySQL credentials:

    default: &default
    adapter: mysql2
    encoding: utf8mb4
    pool: 5
    username: root
    password: password
    host: localhost

   # Important: Replace root and password with your actual MySQL credentials.

2. Setup Rails credentials for secure storage:
   You'll use this later for Stripe API keys.
    EDITOR="nano" rails credentials:edit

3. Create the database:
    rails db:create
   This command will create the ecommerce_app_development and ecommerce_app_test databases based on your database.yml.

## 📁 3) Add Bootstrap via Importmap:
    Rails 8 uses Importmap by default for JavaScript. This means you don't typically need a JavaScript bundler like Webpack. Bootstrap's JavaScript is pinned directly.

1. Pin necessary packages using Importmap:
    bin/importmap pin bootstrap
    bin/importmap pin @popperjs/core
    bin/importmap pin @hotwired/turbo-rails
    bin/importmap pin @hotwired/stimulus
    bin/importmap pin @hotwired/stimulus-loading
    bin/importmap pin rails-ujs
    bin/importmap pin_all_from "app/javascript/controllers", under: "controllers"

2. Modify app/javascript/application.js:
   Ensure your application.js imports Bootstrap and the necessary Rails default JavaScript:
    // app/javascript/application.js
    // Entry point for the build process (Importmap)

    // Import Turbo for fast page navigation
    import "@hotwired/turbo-rails"

    // Import Stimulus for JavaScript behaviors
    import { Application } from "@hotwired/stimulus"
    import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
    window.Stimulus = Application.start()
    eagerLoadControllersFrom("controllers", window.Stimulus)

    // Import Bootstrap's JavaScript and Popper.js (for dropdowns, tooltips etc.)
    import "@popperjs/core"
    import "bootstrap"

    // If you had specific custom JS, you'd import it here too, e.g.:
    // import "custom_js_file"

## 📁 4) Update Application Layout:
    This step sets up the overall structure and styling for your application.

1. Modify app/views/layouts/application.html.erb:
   Ensure Bootstrap CSS and Font Awesome are linked, and JavaScript is included via Importmap.This will also display flash messages (notice, alert) from your controllers.
    <!DOCTYPE html>
    <html>
        <head>
            <title>EcommerceApp</title>
            <meta name="viewport" content="width=device-width,initial-scale=1">
            <%= csrf_meta_tags %>
            <%= csp_meta_tag %>

            <%= stylesheet_link_tag "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css", rel: "stylesheet" %>
            <%= stylesheet_link_tag "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css", media: "all" %>
            <%= stylesheet_link_tag "custom", media: "all", "data-turbo-track": "reload" %>

            <%= javascript_importmap_tags %>
        </head>

        <body>
            <% if flash[:notice].present? %>
                <div class="flash-notice alert-success" data-controller="flash">
                    <%= flash[:notice] %>
                </div>
            <% end %>

            <% if flash[:alert].present? %>
                <div class="flash-notice alert-danger" data-controller="flash">
                    <%= flash[:alert] %>
                </div>
            <% end %>
            <%= render 'layouts/navbar' %> <div class="container mt-4">
            <div class="container mt-4">
                <%= yield %>
            </div>

            <%= render 'layouts/footer' %>
            </div>
        </body>
    </html>

    # Note: Using CDNs is quick for demos. For production, consider using Bootstrap directly via app/assets/stylesheets/application.bootstrap.scss and gem 'font-awesome-sass' in your Gemfile for better asset management and offline capability.

2. Create app/assets/stylesheets/custom.css
    /* app/assets/stylesheets/custom.css */
    body {
        background-color: #f8f9fa; /* Light gray background */
    }
    /* Add any other global custom styles here */

3. Create app/views/layouts/_navbar.html.erb:
    This partial will hold your site's navigation bar (Login, Signup, Cart, Admin/Customer links). Use Bootstrap's navbar component.

4. Create app/views/layouts/_footer.html.erb:
    This partial will display footer on all pages.

## 📁 5) Setting Up Models:
    Models represent your application's data and business logic. Run rails db:migrate after generating all models.

1. Generate User model (with Devise):
    rails generate devise:install
    rails generate devise User first_name:string last_name:string username:string address:text mobile_number:string is_admin:boolean

2. Product model:
    rails generate model Product name:string description:text price:decimal

    # Add image attachment to app/models/product.rb:
    # app/models/product.rb
    has_one_attached :image

3. Order model:
    rails generate model Order user:references total_price:decimal payment_status:integer order_status:integer shipping_address:text
    # app/models/order.rb
    belongs_to :user
    has_many :order_items, dependent: :destroy

    # Define enums for statuses (optional but recommended)
    enum :order_status, { pending: 0, shipped: 1, delivered: 2, cancelled: 3 }, prefix: true
    enum :payment_status, { pending: 0, paid: 1, failed: 2, refunded: 3 }, prefix: :payment

4. OrderItem model:
    rails generate model OrderItem order:references product:references quantity:integer item_price:decimal total_price:decimal
    # app/models/order_item.rb
    belongs_to :order
    belongs_to :product

5. Cart model:
    rails g model cart user:references
    # app/models/cart.rb
    belongs_to :user, optional: true # optional: true allows carts without a user (for guests)
    has_many :cart_items, dependent: :destroy

6. CartItem model:
    rails g model cart_item cart:references product:references quantity:integer total_price:decimal unit_price:decimal
    # app/models/cart_item.rb
    belongs_to :cart
    belongs_to :product

7. Contact model:
    rails g model contact name:string email:string message:text

8. Feedback model:
    rails g model feedback user:references content:text feedback_date:date
    # app/models/feedback.rb
    belongs_to :user

9. Run Migrations (after all model generations):
    rails db:migrate

## 📁 6) Setting Up Controllers:
    Controllers handle incoming requests, interact with models, and prepare data for views.

# 6.1) Core Application Controllers

1. HomeController for landing page:
    rails generate controller Home index --no-assets --no-helper --no-test-framework

    # config/routes.rb: Add 
    root "home#index"

2. CustomerDashboardsController (for product listing):
    rails generate controller CustomerDashboards index --no-assets --no-helper --no-test-framework

    # config/routes.rb: 
    get 'customer_dashboard', to: 'customer_dashboards#index'

3. CartsController (Manages cart functionality):
    rails generate controller Carts show --no-assets --no-helper --no-test-framework

4. OrdersController (Handles order creation and display):
    rails generate controller Orders new create show success cancel --no-assets --no-helper --no-test-framework

    # app/controllers/orders_controller.rb:
    1. before_action :authenticate_user!: All order actions must be for logged-in users.
    2. new action: Displays the checkout form (shipping address). Populates @cart_items.
    3. create action: This is where the order is finalized. It creates Order and OrderItem records from the cart, clears the cart, and initiates the Stripe Checkout Session (see section 7).
    4. show action: Displays details of a specific order.
    5. success action: Stripe redirects here on successful payment. Updates order and payment_status.
    6. cancel action: Stripe redirects here if payment is cancelled. Updates order_status.
    # app/views/orders/new.html.erb: Checkout form.
    # app/views/orders/show.html.erb: Order confirmation/details page.

5. ProfilesController (for user profile management):
    rails generate controller Profiles show edit update --no-assets --no-helper --no-test-framework
        
    # config/routes.rb: 
    resource :profiles, only: [:show, :edit, :update]

6. FeedbacksController (for customer feedback submission):
    rails generate controller Feedbacks new create --no-assets --no-helper --no-test-framework

    # config/routes.rb: 
    resources :feedbacks, only: [:new, :create]

7. PagesController (for static pages like About, Contact):
    rails generate controller Pages about contact --no-assets --no-helper --no-test-framework

    # config/routes.rb: 
    get 'about', to: 'pages#about', get 'contact', to: 'pages#contact'

# 6.2) Admin Panel Controllers
    These controllers are within the Admin namespace and typically require before_action :authenticate_user! and before_action :authorize_admin! (where authorize_admin! checks current_user.admin?).

1. Admin::DashboardsController:
    rails generate controller Admin::Dashboards index --no-assets --no-helper --no-test-framework
    
    # config/routes.rb: 
    Inside namespace :admin do ... end, add get 'dashboard', to: 'dashboards#index'

2. Admin::UsersController:
    rails generate controller Admin::Users index edit update destroy --no-assets --no-helper --no-test-framework
    
    # config/routes.rb: 
    Inside namespace :admin, add resources :users, except: [:show, :new, :create]

3. Admin::OrdersController:
    rails generate controller Admin::Orders index edit update show --no-assets --no-helper --no-test-framework
    
    # config/routes.rb: 
    Inside namespace :admin, add resources :orders, only: [:index, :edit, :update, :show]

4. Admin::FeedbacksController:
    rails generate controller Admin::Feedbacks index show --no-assets --no-helper --no-test-framework
    
    # config/routes.rb: 
    Inside namespace :admin, add resources :feedbacks, only: [:index, :show]

5. Admin::ProductsController:
    rails generate controller Admin::Products --no-assets --no-helper --no-test-framework

    # config/routes.rb: 
    Inside namespace :admin, add resources :products


# 6.3) Custom Devise Controller (for Cart Merging)
    To merge guest cart items into a user's database cart upon login.
1. Generate custom Devise Session Controller:
    rails generate devise:controllers users/sessions

2. Modify app/controllers/users/sessions_controller.rb

3. Update config/routes.rb to use your custom Devise controller:
    # config/routes.rb
    devise_for :users, controllers: { sessions: 'users/sessions' }


📁 7) Payment Gateway Integration (Stripe Checkout)
    This is a critical step for handling actual payments.
1. Add Stripe Gem:
    Add gem 'stripe' to your Gemfile and run bundle install.

2. Configure Stripe API Keys:
    Open your Rails credentials: rails credentials:edit
    Add your Stripe keys securely (use test keys for development):
    # config/credentials.yml.enc (add these lines)
    stripe:
        publishable_key: pk_test_YOUR_STRIPE_PUBLISHABLE_KEY
        secret_key: sk_test_YOUR_STRIPE_SECRET_KEY

    Create config/initializers/stripe.rb:
    # config/initializers/stripe.rb
    Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)


3. Initiate Stripe Checkout Session in OrdersController#create:
    Modify your OrdersController#create action to create a Stripe Checkout Session after the Order and OrderItem records are successfully saved.
    # app/controllers/orders_controller.rb (inside create action)

    1. Calculate total amount in cents for Stripe
    2. Create Stripe Checkout Session
    3. Redirect to Stripe Checkout page

4. Handle Stripe Callbacks in OrdersController#success and OrdersController#cancel:
    These actions are the URLs Stripe redirects to after a payment attempt.
    # app/controllers/orders_controller.rb
    success and cancel action for redirect after payment success and cancel.


📁 8) Stripe Webhooks (CRITICAL FOR PRODUCTION)
    Webhooks are automated notifications sent by Stripe to your application when certain events occur (e.g., a payment succeeds, a refund is issued, etc.). They are **essential for a reliable payment system** because they don't rely on user redirects, which can be interrupted. Your `WebhooksController` acts as the endpoint that receives and processes these crucial notifications.
    
# app/controllers/webhooks_controller.rb
    
# config/routes.rb
post 'webhooks/stripe', to: 'webhooks#stripe'



🏃 Running Your Application
1. Start the Rails server:
    rails server

2. Open in browser: Go to http://localhost:3000


💳 Stripe Test Card:
# Use this card during testing:
    Card: 4242 4242 4242 4242
    Expiry: Any future date
    CVV: Any 3-digit
    ZIP: Any 5-digit