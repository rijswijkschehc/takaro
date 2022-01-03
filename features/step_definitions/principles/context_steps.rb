# frozen_string_literal: true

Given 'a principle named {string}' do |name|
  create(:principle, name: name)
end
