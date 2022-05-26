# frozen_string_literal: true

class PersonUserConnection < ApplicationRecord
  belongs_to :person
  belongs_to :user
end
