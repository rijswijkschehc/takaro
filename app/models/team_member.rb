# frozen_string_literal: true

class TeamMember < ApplicationRecord
  belongs_to :person
  belongs_to :team
end
