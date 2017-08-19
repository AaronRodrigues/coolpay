require './app/models/client'
require './app/models/authorization'

describe Authorization do
  subject(:post_request) { described_class.new(client: client, body: credentials) }
  let(:uri) { "https://coolpay.herokuapp.com/api/login" }
  let(:http) { double(:http, request: 'token') }
  let(:credentials) { {"username": "your_username", "apikey": "5up3r$ecretKey!"} }
  let(:client) { double(:client, get_request_uri: uri, http: http) }

  describe '#send' do
    it 'a request' do
      expect(post_request.client.http).to receive(:request)
      post_request.send
    end
  end

  describe('#set') do
    before do
      @http_request = post_request.set(body: credentials, token: nil)
    end

    it('creates a post request') do
      expect(@http_request).to be_kind_of(Net::HTTP::Post)
    end

    it('stores msg in the body') do
      expect(@http_request.body).to eq(credentials.to_json)
    end

     it('does not have header') do
      expect(@http_request['authorization']).to eq nil
    end

    it('has a header') do
      expect(@http_request['content-type'.to_sym]).to eq 'application/json'
    end

    it('has a header if token is not nil') do
      http_request = post_request.set(body: credentials, token: 'abc')
      expect(http_request['authorization']).to eq 'User abc'
    end
  end
end