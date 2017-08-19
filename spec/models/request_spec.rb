require './app/models/request'

describe Request do
  let(:uri) {"https://www.facebook.com"}
  subject(:request) { described_class.new(uri)}

    describe('#uri') do
      it('returns a uri') do
      expect(request.uri).to be_kind_of(URI)
    end
  end
    describe('#Create http') do
      it('creates an http object') do
        expect(request.create_http).to be_kind_of(Net::HTTP)
    end
  end
end

