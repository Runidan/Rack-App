class TimeFormat
  FORMATES = %w[year month day hour minute second].freeze

  attr_reader :status, :body

  def initialize(format)

  end

  def status 
    200
  end

  def body
    ['body-timeFormat']
  end
end