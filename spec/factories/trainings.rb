# frozen_string_literal: true

FactoryBot.define do
  factory :training do
    objective { 'Uitspelen van een vier tegen drie' }
    step

    after(:create) do |training, _enumerator|
      training.principles << create(:principle)
    end
  end
end
