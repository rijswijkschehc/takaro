# frozen_string_literal: true

module Breadcrumbs
  extend ActiveSupport::Concern

  included do
    before_action :add_breadcrumbs

    helper_method :breadcrumbs
  end

  def breadcrumbs
    @breadcrumbs ||= []
  end

  def add_breadcrumb(name, path = nil)
    breadcrumbs << Breadcrumb.new(name, path)
  end

  private

  def add_breadcrumbs
    add_breadcrumb(_('RHC playing style'))
  end
end
