require "sinatra/base"

class Result < App
    get '/' do
        "hey"
        erb :result
    end
end
