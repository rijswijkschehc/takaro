# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'user@takaro.test' }
    password { 'super-secret' }
    confirmed_at { Time.current }
  end

  factory :admin, parent: :user do
    after(:build) do |user|
      user.add_role(:admin)
    end
  end
end
