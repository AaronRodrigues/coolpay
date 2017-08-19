require './app/models/client'

describe Client do
  subject(:request) { described_class.new(uri: uri) }
  let(:uri) {"https://www.facebook.com"}
  let(:credentials) {{"username": "your_username", "apikey": "5up3r$ecretKey!"} }


    describe('#uri') do
      it('returns a uri') do
      expect(request.uri).to be_kind_of(URI)
    end
  end
    describe('#Create http') do
      it('creates an http object') do
        expect(request.http).to be_kind_of(Net::HTTP)
    end
  end

  describe('create_post_request') do
    before do
      @http_request = request.set_post_request(body: credentials)
    end

    it('creates a post request') do
      expect(@http_request).to be_kind_of(Net::HTTP::Post)
    end

    it('which stores message to body of request') do
      expect(@http_request.body).to eq(credentials.to_json)
    end

    it('that has the given header') do
      expect(@http_request['content-type'.to_sym]).to eq 'application/json'
    end
  end
end
