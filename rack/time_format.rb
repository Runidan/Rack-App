# frozen_string_literal: true

class TimeFormat
  RIGHT_FORMATES = %w[year month day hour minute second].freeze

  attr_reader :status, :body

  def initialize(formats)
    @formats = formats
    if format_valid?
      answer
    else
      error_formats
    end
  end

  def format_valid?
    wrong_formats.empty?
  end

  private

  def wrong_formats
    @wrong_formats = @formats - RIGHT_FORMATES
  end

  def error_formats
    @body = "Unknown time format #{@wrong_formats}\n"
  end

  def answer
    time_now = Time.now
    time_data = @formats.map do |format|
      format = :min if format == 'minute'
      format = :sec if format == 'second'
      time_now.send(format.to_sym)
    end
    @body = "#{time_data.join('-')}\n"
  end
end
