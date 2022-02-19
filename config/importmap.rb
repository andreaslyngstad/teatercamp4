# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "trix"
pin "@rails/actiontext", to: "actiontext.js"
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.6.0/dist/jquery.js"
pin_all_from  "app/javascript/", under: "javascript"
# pin 'jquery', to: 'https://code.jquery.com/jquery-1.12.4.min.js'
pin_all_from "app/javascript/controllers", under: "controllers"
pin 'tablesorter', to: 'https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.3/js/jquery.tablesorter.min.js'
pin 'slick', to: 'https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js'
pin 'quicksearch', to: 'https://cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.4.0/jquery.quicksearch.min.js'
