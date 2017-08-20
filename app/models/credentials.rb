class Credentials

  def initialize(username: ENV['USERNAME'], apikey: ENV['API_KEY'])
    @username = username
    @apikey = apikey
  end

  def to_json
    { 'username': username, 'apikey': apikey }
  end

  private
  attr_reader :username, :apikey
end
