# frozen_string_literal: true

When 'the period page for {period} is shown' do |period|
  visit period_path(period)
end
