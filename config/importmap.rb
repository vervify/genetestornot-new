# Pin npm packages by running ./bin/importmap

pin 'application'
pin '@hotwired/turbo-rails', to: 'turbo.min.js'
pin '@hotwired/stimulus', to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin_all_from 'app/javascript/controllers', under: 'controllers'

# jQuery support for existing functionality
pin 'jquery', to: 'https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.js'
pin 'jquery-ui', to: 'https://cdn.jsdelivr.net/npm/jquery-ui@1.14.1/dist/jquery-ui.min.js', preload: true
