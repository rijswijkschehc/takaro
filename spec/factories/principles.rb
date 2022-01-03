# frozen_string_literal: true

FactoryBot.define do
  factory :principle do
    description { 'De eerste intentie van een Rijswijker in balbezit is voorwaarts en binnendoor' }
    icon { 'crosshairs' }
    hex_color { 'eb4320' }
    name { 'Doelgericht' }
    possession_phase
    tagline { 'Voorwaarts en binnendoor' }
  end
end
