# frozen_string_literal: true

class Runtime
  def initialize(app)
    @app = app
  end

  def call(env)
    start = Time.now
    status, header, body = @app.call(env)
    header['X-Runtime'] = format('%fs', (Time.now - start))

    [status, header, body]
  end
end
