class App

  def call(env)
    perform_request
    [status, header, body]
  end

private

  def perform_request
    sleep rand(2..3)
  end

  def status
    200
  end

  def header
    { 'Content-Type' => 'text/plain' }
  end

  def body
    ["Welcome aboard\n"]
  end
end
