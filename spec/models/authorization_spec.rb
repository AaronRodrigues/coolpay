require './app/models/client'
require './app/models/authorization'

describe Authorization do
  subject(:post_request) { described_class.new(client: client, credentials: credentials) }
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
      @http_request = post_request.set(body: credentials)
    end

    it('creates a post request') do
      expect(@http_request).to be_kind_of(Net::HTTP::Post)
    end

    it('has stores the given message in the body of the request') do
      expect(@http_request.body).to eq(credentials.to_json)
    end

    it('has the given header') do
      expect(@http_request['content-type'.to_sym]).to eq 'application/json'
    end
  end
end