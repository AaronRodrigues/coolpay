require_relative '../app/models/request'

describe Request do
  let(:uri) {"https://www.facebook.com"}
  subject(:request) { described_class.new(uri)}

    describe('uri') do
      it('returns a uri') do
      expect(request.uri).to be_kind_of(URI)
    end
  end
end

