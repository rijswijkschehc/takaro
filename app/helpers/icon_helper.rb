# frozen_string_literal: true

module IconHelper
  def icon(id:, margin: nil)
    tag.i(class: classes(id: id, margin: margin))
  end

  private

  def classes(id:, margin:)
    %w[fas].tap do |a|
      a << "fa-#{id}"
      a << "m#{margin}"
    end
  end
end
