# frozen_string_literal: true

Then '{string} is displayed' do |content|
  expect(page).to have_text(content)
end

Then 'a(n) {string} alert containing {string} is displayed' do |type, content|
  expect(page).to have_tag(:div,
                           with: { class: "alert alert-#{type}" },
                           text: /#{content}/)
end

Then 'a validation error containing {string} is displayed' do |content|
  expect(page).to have_tag(:div,
                           with: { class: 'invalid-feedback' },
                           text: /#{content}/)
end
