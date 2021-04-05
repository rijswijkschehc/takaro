# frozen_string_literal: true

module FlashHelper
  def render_flash_messages
    safe_join(
      FlashConverter.new(flash: flash).messages.map do |message|
        tag.div(sanitize(message[:content]), class: message[:classes])
      end
    )
  end
end
