require './app/models/authorization'
require './app/models/client'
require './app/models/credentials'
require './app/models/request'

require 'dotenv/load'
USERNAME      = ENV['USERNAME']
API_KEY       = ENV['API_KEY']

require 'sinatra/base'
require 'net/http'
require 'uri'
require 'json'

class Coolpay < Sinatra::Base
  
  enable :sessions

  helpers do
    def token
      @token ||= session[:token]
    end
  end

  get '/' do
    erb :'index'
  end

  post '/users' do
    client = Client.new(uri: "https://coolpay.herokuapp.com/api/login")
    credentials = Credentials.new.format_json
    request = Request.new(type: 'POST', uri: client.get_request_uri)
    response = client.http.request(request.build(message: credentials))
    session[:token] = JSON.parse(response.body)['token']
    redirect to '/transactions'
  end

  get '/transactions' do
    client = Client.new(uri: "https://coolpay.herokuapp.com/api/recipients")
    get_request = Net::HTTP::Get.new(client.uri)
    get_request['Authorization'] = "User #{token}" if token != nil
    response = client.http.request(get_request)
    @recipients = JSON.parse(response.body)['recipients']
    p @recipients
    erb :'transactions/index'
  end
  
  post '/recipients/new' do
    client = Client.new(uri: "https://coolpay.herokuapp.com/api/recipients")
    request = Authorization.new(client: client, body: {'recipient': {'name': params[:recipient]}})
    response = request.send(token: token)
    p response.body
    redirect to '/transactions'
  end

end