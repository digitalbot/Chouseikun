require "sinatra/base"
require "google/api_client"
require "net/https"
#require "sinatra/cookies"
#require 'google/api_client/client_secrets'
#require 'google/api_client/auth/file_storage'
require 'google/api_client/auth/installed_app'
require 'logger'
require 'json'

class Dev < App
    get '/' do  
        redirect_to "https://accounts.google.com/o/oauth2/auth?"\
        "client_id=274423559034 &"\
        "redirect_uri=http//localhost&"\
        "scope=https://www.googleapis.com/auth/plus.me&"\
        "response_type=code" and return if session[:access_token].blank?
    end
end

	
