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
    uri = URI.parse('https://coolpay.herokuapp.com/api/login')
    header = {'Content-Type': 'application/json'}
    credentials = {
      'username': "#{USERNAME}",
      'apikey': "#{API_KEY}"
    }
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = credentials.to_json
    response = http.request(request)
    p response.body
    redirect to '/transactions'
  end

  get '/transactions' do
    "Transaction page"
  end

end