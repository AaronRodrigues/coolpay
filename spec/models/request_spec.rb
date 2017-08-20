require './app/models/request'

describe Request do
  let(:login_uri) { "/api/login" }
  let(:token) { 'secret'}
  let(:credentials) { {"username": "your_username", "apikey": "5up3r$ecretKey!"} }
  subject(:post) { described_class.new(type: 'POST', uri: login_uri) }
  subject(:get) { described_class.new(type: 'GET', uri: login_uri)}

  describe '#request' do
    context 'POST' do
      it('returns a post request when the given type is POST') do
        expect(post.request).to be_kind_of(Net::HTTP::Post)
      end

      it('has a header') do
        expect(post.request['content-type'.to_sym]).to eq 'application/json'
      end
    end

    context 'GET' do
      it('returns a get request when the given type is GET') do
        expect(get.request).to be_kind_of(Net::HTTP::Get)
      end

      it('has a content-type header') do
        expect(get.request['content-type'.to_sym]).to eq 'application/json'
      end
    end
  end

  describe '#build' do
    context 'post request' do
      it('stores credentials in body') do
        post.build(message: credentials)
        expect(post.get_body).to eq(credentials.to_json)
      end

      it('has an authorization header') do
        post.build(token: token)
        expect(post.request['authorization']).to eq "Bearer #{token}"
      end

      it('is nil when not authorized') do
        post.build
        expect(post.request['authorization']).to eq nil
      end
    end

    context 'GET request' do
      it('has no body') do
        get.build
        expect(get.get_body).to eq(nil)
      end
    end

    it('has a header if passes authorization') do
      get.build(token: token)
      expect(get.request['authorization']).to eq "Bearer #{token}"
    end

    it('does not have a header if fails authorization') do
      get.build
      expect(get.request['authorization']).to eq nil
    end
  end
end
