# Ecommerce-App
1) Steps to create App
rails new ecommerce_app -d mysql
cd ecommerce_app
bundle install

2) Update database.yml file for setting username and password for mysql:
EDITOR="nano" rails credentials:edit (using credentials in rails)
rails db:create
