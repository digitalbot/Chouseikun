require "./app"
require "./event"
require "./dev"

map('/') { run App }
map('/event') { run Event }
map('/dev') { run Dev }
