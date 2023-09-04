# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "https://ga.jspm.io/npm:@hotwired/stimulus@3.2.2/dist/stimulus.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "stimulus-read-more", to: "https://ga.jspm.io/npm:stimulus-read-more@4.1.0/dist/stimulus-read-more.mjs"
pin "@rails/actioncable", to: "https://cdn.jsdelivr.net/npm/@rails/actioncable@7.0.7-2/app/assets/javascripts/actioncable.esm.js"
