// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@popperjs/core"
import "bootstrap"
import "@hotwired/turbo-rails"
import "controllers"
import Rails from "rails-ujs";
import { Application } from "@hotwired/stimulus"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"

Rails.start();
const application = Application.start()
eagerLoadControllersFrom("controllers", application)