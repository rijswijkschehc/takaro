# frozen_string_literal: true

module Equipment
  class LockDecorator < ApplicationDecorator
    def number_and_code(link:)
      number = link ? h.link_to(model.number, h.admin_equipment_lock_path(model)) : model.number
      code = h.tag.code(model.code)

      h.safe_join([number, ' / ', code])
    end
  end
end
