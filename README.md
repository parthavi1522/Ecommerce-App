# Ecommerce-App
1) Steps to create App:
- rails new ecommerce_app -d mysql
- cd ecommerce_app
- bundle install

2) Update database.yml file for setting username and password for mysql:
- EDITOR="nano" rails credentials:edit (using credentials in rails)
- rails db:create

3) Add Bootstrap via importmap
- bin/importmap pin bootstrap
- bin/importmap pin popper.js --from=npm:@popperjs/core

-> Modify app/javascript/application.js:
- import "bootstrap"
- import "popper.js"

-> Add below to app/views/layouts/application.html.erb:
-   <%= stylesheet_link_tag "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css", rel: "stylesheet" %>
