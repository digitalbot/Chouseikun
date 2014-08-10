require "sinatra/base"

module Chouseikun
    class App < Sinatra::Base
        get '/' do
            'hello'
        end
    end
end

	
