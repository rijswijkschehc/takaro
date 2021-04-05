# frozen_string_literal: true

class FlashConverter
  attr_reader :flash

  def initialize(flash:)
    @flash = flash.to_h
  end

  def messages
    flash.except('timedout').map do |type, message|
      {
        content: content(message: message),
        classes: classes(type: type)
      }
    end
  end

  private

  def content(message:)
    parsed_message = Nokogiri::HTML::DocumentFragment.parse(message)
    parsed_message.css('a').map { |a| a['class'] = 'alert-link' }
    parsed_message.to_html
  end

  def classes(type:)
    %w[alert].tap do |a|
      a << "alert-#{mapped_type(type: type)}"
    end
  end

  def mapped_type(type:)
    case type
    when 'notice'
      'info'
    when 'alert', 'recaptcha_error'
      'danger'
    else
      type
    end
  end
end
