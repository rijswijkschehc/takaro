# frozen_string_literal: true

FactoryBot.define do
  factory :exercise do
    description { 'Dreierlaufjes' }
    step
    tips { 'Laag zitten' }
    title { 'Dreierlaufjes' }
    variation { 'Uit de loop passen' }
  end
end
