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

Then 'the user menu {does_or_not} contain the {string} link' do |does_or_not, link|
  expect(page).public_send(does_or_not, have_selector('.navbar .dropdown-item', text: link))
end
