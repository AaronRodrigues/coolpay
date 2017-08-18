class Request

  attr_reader :uri
  
  def initialize(uri)
    @uri = URI.parse(uri)
    @header = {'Content-Type': 'application/json'}
  end

end