# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "controllers/hello_controller.js", to: "controllers/hello_controller.js", preload: true

# Pin sortableJS cdn
pin "sortablejs", to: "https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.13.0/Sortable.min.js", preload: true