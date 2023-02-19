# frozen_string_literal: true

require_relative 'time_format'

class App
  def call(env)
    request = Rack::Request.new env
    res = Rack::Response.new
    if request_valid?(request)
      time_formater = TimeFormat.new request.params['format']
      res.status = time_formater.status
      res.write time_formater.body
    end
    res.finish
  end

  private

  def request_valid?(request)
    request.get? && request.params['format']
  end
end
