# frozen_string_literal: true

When 'the user fills {string} in with {string}' do |input, value|
  fill_in input, with: value
end

When 'the user submits the form with:' do |table|
  table.rows_hash.each do |field, value|
    fill_in field, with: value
  end

  click_button 'commit'
end

When 'the user submits the form' do
  click_button 'commit'
end
