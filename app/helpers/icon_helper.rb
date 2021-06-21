# frozen_string_literal: true

module IconHelper
  def icon(id:, margin: nil, fixed: false)
    tag.i(class: classes(id: id, margin: margin, fixed: fixed))
  end

  private

  def classes(id:, margin:, fixed:)
    %w[fas].tap do |a|
      a << "fa-#{id}"
      a << "m#{margin}" if margin
      a << 'fa-fw' if fixed
    end
  end
end
