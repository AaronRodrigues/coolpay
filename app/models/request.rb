class Request

  attr_reader :uri
  
  def initialize(uri)
    @uri = URI.parse(uri)
    @header = {'Content-Type': 'application/json'}
  end

  def create_http
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http
  end

end