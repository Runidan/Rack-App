require_relative 'time_format'

class App

  def call(env)
    @status = 404
    @header = { 'Content-Type' => 'text/plain' }
    @body = ["Error\n"]
    make_answer(env)
    [@status, @header, @body]
  end

private

  def make_answer(env)
    request = Rack::Request.new(env)
    if request_valid?(request)
      time_format = TimeFormat.new(request.params['format'])
      @status = time_format.status
      @body = time_format.body
    end
  end

  def request_valid?(request)
    request.path == '/time' && request.request_method == 'GET' && request.params['format']
  end

end
