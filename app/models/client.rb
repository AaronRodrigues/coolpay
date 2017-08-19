class Client

  attr_reader :uri, :http

  CONTENT_TYPE = {'Content-Type': 'application/json'}

  def initialize(uri:)
    @uri = URI.parse(uri)
    @http = create_http
  end

  def set_post_request(body:)
    request = Net::HTTP::Post.new(uri.request_uri, CONTENT_TYPE)  
    request.body = body.to_json
    request
  end

  def get_request_uri
    uri.request_uri
  end

  private
  def create_http
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http
  end

end