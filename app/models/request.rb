class Request

  attr_reader :uri, :http, :header
  
  def initialize(uri)
    @uri = URI.parse(uri)
    @header = {'Content-Type': 'application/json'}
    @http = create_http
  end

  def set_post_request(body, header)
    request = Net::HTTP::Post.new(uri.request_uri, header)  
    request.body = body.to_json
    request
  end

  private
  def create_http
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http
  end

end