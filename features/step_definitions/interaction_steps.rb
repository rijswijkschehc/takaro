# frozen_string_literal: true

When 'the user clicks on {string}' do |text|
  click_on(text)
end

When 'the user waits {int} second(s)' do |seconds|
  sleep(seconds)
end
