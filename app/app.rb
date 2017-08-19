require './app/models/request'
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
    payment = Request.new(uri: 'https://coolpay.herokuapp.com/api/login')
    credentials = {
      'username': "#{USERNAME}",
      'apikey': "#{API_KEY}"
    }
    request = payment.set_post_request(body: credentials)
    response = payment.http.request(request)
    p response.body
    redirect to '/transactions'
  end

  get '/transactions' do
    "Transaction page"
  end

end