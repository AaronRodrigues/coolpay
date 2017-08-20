require './app/models/credentials'

describe Credentials do
  let(:default) { {'username': ENV['USERNAME'], 'apikey': ENV['API_KEY'] } }
  let(:other)  { {"username": "your_username", "apikey": "5up3r$ecretKey!"} }
  subject(:credentials) { described_class.new }

  describe('#to_json') do
    it('converts default credentials to json') do
      expect(credentials.to_json).to eq default
    end

    it('converts given credentials to json') do
      cr = described_class.new(username: "your_username", apikey: "5up3r$ecretKey!")
      expect(cr.to_json).to eq other
    end
  end
end
