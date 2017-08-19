class Authorization

  CONTENT_TYPE = {'Content-Type': 'application/json'}

  attr_reader :client, :body

  def initialize(client:, body:)
    @client = client
    @body = body
  end

  def send(token:nil)
    http_request = set(body: body, token: token)
    client.http.request(http_request)
  end

  def set(body:, token:)
    request = Net::HTTP::Post.new(client.get_request_uri, CONTENT_TYPE)
     request['Authorization'] = "User #{token}" if token != nil
    request.body = body.to_json
    request
  end
end