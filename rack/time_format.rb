class TimeFormat
  RIGHT_FORMATES = %w[year month day hour minute second].freeze

  attr_reader :status, :body

  def initialize(formats)
    @formats = formats.split(",")
    return error_formats if wrong_formats.any?
    answer
  end

  private

  def wrong_formats
    @wrong_formats = @formats - RIGHT_FORMATES
  end

  def error_formats
    @status = 400
    @body = ["Unknown time format #{@wrong_formats}\n"] 
  end

  def answer
    @status = 200
    time = Time.now
    time_params = @formats.map { |format| time_now.send(format.to_sym) }.join('-')
    @body = ["#{time_params}\n"]
  end
end
