require "sinatra/base"

class App < Sinatra::Base
    get '/' do
         erb :index
    end
    get '/event' do
         erb :event
    end
end
