# frozen_string_literal: true

Given 'a user named {string}' do |name|
  User.create(email: "#{name.downcase}@riswa.nl", password: 'super-secret', confirmed_at: Time.current)
end

Given 'an admin named {string}' do |name|
  User.create(email: "#{name.downcase}@riswa.nl", password: 'super-secret', confirmed_at: Time.current) do |user|
    user.add_role(:admin)
  end
end

Given '{string} is signed in' do |name|
  user = User.find_by(email: "#{name.downcase}@riswa.nl")
  login_as(user)
end
