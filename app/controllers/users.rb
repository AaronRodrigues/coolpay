class Coolpay < Sinatra::Base

  post '/users' do
    credentials = Credentials.new.to_json
    response = api.send_request(path: 'login', type: 'POST', message: credentials)
    session[:token] = JSON.parse(response.body)['token']
    redirect to '/payments'
  end
end
