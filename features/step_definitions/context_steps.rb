# frozen_string_literal: true

Given 'a user named {string}' do |name|
  User.create(email: "#{name.downcase}@takaro.test",
              password: 'super-secret',
              confirmed_at: Time.current,
              person_attributes: { screen_name: name })
end

Given 'an admin named {string}' do |name|
  User.create(email: "#{name.downcase}@takaro.test", password: 'super-secret', confirmed_at: Time.current) do |user|
    user.add_role(:administrator)
  end
end

Given '{string} is signed in' do |name|
  user = User.find_by(email: "#{name.downcase}@takaro.test")
  login_as(user)
end
