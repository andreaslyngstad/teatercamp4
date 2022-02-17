# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "trix"
pin "@rails/actiontext", to: "actiontext.js"
pin 'jQuery', to: 'https://code.jquery.com/jquery-1.12.4.min.js'
pin_all_from "app/javascript/controllers", under: "controllers"
pin 'tablesorter', to: 'https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.3/js/jquery.tablesorter.min.js'
pin 'quicksearch', to: 'app/assets/javascript/jquery.quicksearch.js'
# pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.6.0/dist/jquery.js"
pin "tablesorter", to: "https://ga.jspm.io/npm:tablesorter@2.31.3/dist/js/jquery.tablesorter.combined.js"
