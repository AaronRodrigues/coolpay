require 'sinatra/base'
require 'net/http'

class Coolpay < Sinatra::Base

  get '/' do
    erb :'index'
  end

  post '/users' do
    redirect to '/transactions'
  end

  get '/transactions' do
    "Transaction page"
  end

end