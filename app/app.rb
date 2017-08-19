require './app/models/authorization'
require './app/models/credentials'
require './app/models/client'
require 'dotenv/load'
USERNAME      = ENV['USERNAME']
API_KEY       = ENV['API_KEY']

require 'sinatra/base'
require 'net/http'
require 'uri'
require 'json'

class Coolpay < Sinatra::Base

  get '/' do
    erb :'index'
  end

  post '/users' do
    client = Client.new(uri: "https://coolpay.herokuapp.com/api/login")
    credentials = Credentials.new.format_json
    auth = Authorization.new(client: client, credentials: credentials)
    auth.send
    p response.body
    redirect to '/transactions'
  end

  get '/transactions' do
    "Transaction page"
  end

end