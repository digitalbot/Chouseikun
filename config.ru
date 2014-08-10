require "./app"
require "./dev"

map('/') { run App }
map('/dev') { run Dev }
