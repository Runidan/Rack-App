require_relative 'time_format'

class App

  def call(env)
    @status = 200
    @body = ["Error\n"]
    make_answer(env)
    [@status, {}, @body]
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
    request.request_method == 'GET' && request.params['format']
  end

end
