# frozen_string_literal: true

module ActiveStorageHelper
  def active_storage_figure_classes(blob:)
    %w[attachment].tap do |a|
      a << "attachment--#{blob.representable? ? 'preview' : 'file'}"
      a << "attachment--#{blob.filename.extension}"
    end
  end
end
