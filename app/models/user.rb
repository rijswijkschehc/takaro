# frozen_string_literal: true

class User < ApplicationRecord
  include Roles

  # :registerable is disabled for now: Will re-enable when actual registrations are open
  devise :database_authenticatable, :validatable, :rememberable,
         :recoverable, :trackable, :confirmable, :lockable
  has_paper_trail only: %i[email encrypted_password]
  rolify role_join_table_name: :user_roles
end
