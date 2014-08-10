require "sinatra/base"
require "date"

class App < Sinatra::Base
    enable :sessions
    set :session_secret, 'Chouseikun session secret'

    get '/' do
        session[:test] = 'chinpo'
         erb :index
    end

    get '/event' do
        today = Date.today
        from = []
        to   = []

        for num in 1..100 do
            from.push((today + num).strftime('%Y/%m/%d'))
            to.push((today + num + 1).strftime('%Y/%m/%d'))
        end

        @from_day = from
        @to_day   = to
        erb :event
    end

    get '/result' do
        @eid = session[:eid]
        @description = session[:description]

        session.clear
        erb :result
    end

    post '/result' do
        eid = 0;
        File.open('eid.conf', 'r+') do |f|
            f.each do |line|
                eid = line.chomp.to_i
                eid += 1
            end
        end
        File.open('eid.conf', 'w') do |f|
            f.write(eid)
        end
        session[:eid] = eid
        session[:description] = params['description']
        redirect '/result'
    end
end
