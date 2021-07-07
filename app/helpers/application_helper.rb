# frozen_string_literal: true

module ApplicationHelper
  def combined_dom_id(*records, prefix: nil)
    records.map do |record|
      record = record.model if record.decorated?
      dom_id(record, prefix)
    end.join('_')
  end
end
