require "sinatra/base"

module Chouseikun
    class App < Sinatra::Base
        get '/' do

          erb :index
        end
	get '/event' do
          erb :event
        end

    end
end

	
