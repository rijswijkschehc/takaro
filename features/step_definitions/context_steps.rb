# frozen_string_literal: true

Given 'a user named {string}' do |name|
  User.create(email: "#{name.downcase}@takaro.test",
              password: 'super-secret',
              confirmed_at: Time.current,
              profile_attributes: { screen_name: name })
end

Given 'a user named {string} with role(s):' do |name, table|
  step "a user named '#{name}'"

  User.find_by(email: "#{name.downcase}@takaro.test").tap do |user|
    table.headers.each { |role| user.add_role(role) }
  end
end

Given '{string} is signed in' do |name|
  user = User.find_by(email: "#{name.downcase}@takaro.test")
  login_as(user)
end

Given 'an equipment location named {string}' do |name_with_ancestry|
  location = nil

  name_with_ancestry.split(' / ').each do |name|
    location = Equipment::Location.create(name: name, parent: location)
  end
end

Given 'an equipment lock with number {int} and code {string}' do |number, code|
  Equipment::Lock.create(number: number, code: code)
end
