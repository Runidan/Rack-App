class App

  def call(env)
    [status, header, body]
  end

private

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
