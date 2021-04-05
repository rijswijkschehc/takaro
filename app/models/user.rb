# frozen_string_literal: true

class User < ApplicationRecord
  include Roles

  devise :database_authenticatable, :registerable, :validatable, :rememberable,
         :recoverable, :trackable, :confirmable, :lockable
  has_paper_trail only: %i[email encrypted_password]
  rolify role_join_table_name: :user_roles
end
