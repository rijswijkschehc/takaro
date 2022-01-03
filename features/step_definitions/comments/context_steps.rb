# frozen_string_literal: true

Given 'a comment {string}' do |objective, user|
  PaperTrail.request(whodunnit: user) do
    create(:exercise, title: objective, objective: objective)
  end
end
