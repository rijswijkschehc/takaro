# frozen_string_literal: true

FactoryBot.define do
  to_create do |instance|
    unless instance.save
      errors = instance.errors.full_messages.join(', ')
      raise "Invalid #{instance.class.name}: #{errors}"
    end
  end
end
