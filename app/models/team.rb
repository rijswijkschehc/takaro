# frozen_string_literal: true

class Team < ApplicationRecord
  has_paper_trail only: %i[name]

  has_many :team_members, dependent: :destroy
  has_many :people, through: :team_members

  validates :name, presence: true
end
