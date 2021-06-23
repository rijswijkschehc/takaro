# frozen_string_literal: true

Given 'a period named {string}' do |name|
  today = Date.current

  Period.create(name: name,
                description: 'Prepping for the season',
                starts_on: today + 1.month,
                ends_on: today + 2.months)
end
