# frozen_string_literal: true

module IconHelper
  def icon(id:)
    tag.i(class: "fas fa-#{id}")
  end
end
