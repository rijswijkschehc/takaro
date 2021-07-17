# frozen_string_literal: true

module ProfileHelper
  def profile_image(user:, size:, style:)
    if user.profile_image&.attached?
      uploaded_image(user: user, size: size, style: style)
    else
      default_image(size: size, style: style)
    end
  end

  private

  def uploaded_image(user:, size:, style:)
    image_tag(
      user.profile_image.variant(
        resize: "#{size}x#{size}^", gravity: 'Center', extent: "#{size}x#{size}"
      ),
      alt: user.screen_name,
      class: css_class(style: style)
    )
  end

  def default_image(size:, style:)
    image_pack_tag('speelwijze.svg',
                   alt: _('Default profile image'),
                   class: css_class(style: style),
                   width: size,
                   height: size)
  end

  def css_class(style:)
    {
      rounded: 'rounded',
      circle: 'rounded-circle'
    }[style]
  end
end
