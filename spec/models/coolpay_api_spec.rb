require './app/models/coolpay_api'

describe CoolpayAPI do
  subject(:api) { described_class.new(http_client_class: http_client_class, http_request_class: http_request_class) }
  let(:http) { double(:http, request: { "token": "0a1111-101010-10010-101a10-1111" })}
  let(:http_client) { double(:http_client, get_request_uri: '/login', http: http)}
  let(:http_client_class) { double(:http_client_class, new: http_client) }
  let(:http_request) { double(:http_request, get_body: credentials, build: nil)}
  let(:http_request_class) { double(:http_request_class, new: http_request) }
  let(:credentials) { { "username": "your_username", "apikey": "5up3r$ecretKey!" } }
  

  describe('#send_request') do
    it('creates a new client') do
      expect(http_client_class).to receive(:new).with(path:'login')
      api.send_request(path:'login', type:'GET')
    end

    it('creates a new http request') do
      expect(http_request_class).to receive(:new).with(type:'GET', uri:'/login')
      api.send_request(path:'login', type:'GET')
    end

    it('creates a request containing the given message') do
      expect(http_request).to receive(:build).with(message: credentials, token: nil)
      api.send_request(path:'login', type:'GET', message: credentials)
    end

    it('creates a request containing the authorization token') do
      expect(http_request).to receive(:build).with(message: credentials, token: 'abc')
      api.send_request(path:'login', type:'GET', message: credentials, token: 'abc')
    end

    it('sends the request') do
      expect(http).to receive(:request).with(http_request.build)
      api.send_request(path:'login', type:'GET')
    end
  end
end
