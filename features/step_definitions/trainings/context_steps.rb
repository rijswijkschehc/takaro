# frozen_string_literal: true

Given 'a(n) training about {string} by {user}' do |objective, user|
  PaperTrail.request(whodunnit: user) do
    create(:training, title: objective, objective: objective)
  end
end
