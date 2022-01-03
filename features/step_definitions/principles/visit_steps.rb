# frozen_string_literal: true

When 'the principles page is shown' do
  visit principles_path
end

When 'the principle page for {principle} is shown' do |principle|
  visit principle_path(principle)
end
