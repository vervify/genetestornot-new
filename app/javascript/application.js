// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// Import jQuery for existing functionality
import jquery from "jquery"
window.jQuery = jquery
window.$ = jquery

// Import existing JavaScript functionality
import "./legacy/google_analytics"
import "./legacy/home"
import "./legacy/questions"