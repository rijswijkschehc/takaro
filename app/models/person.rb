# frozen_string_literal: true

class Person < ApplicationRecord
  has_paper_trail only: %i[name]

  has_many :team_members, dependent: :destroy
  has_many :teams, through: :team_members
  has_many :person_user_connections, dependent: :destroy
  has_many :users, through: :person_user_connections

  validates :name, presence: true
end
