# frozen_string_literal: true

module SidenavHelper
  def sidenav_periods
    tag.ul(safe_join(list_items))
  end

  private

  def list_items
    Period.order(:starts_on).map { |period| tag.li(link_to(period.name, period)) }
  end
end
