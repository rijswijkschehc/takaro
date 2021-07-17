# frozen_string_literal: true

class User < ApplicationRecord
  include Roles

  # TODO: registerable is disabled for now: Will re-enable when actual registrations are open
  devise :database_authenticatable, :validatable, :rememberable,
         :recoverable, :trackable, :confirmable, :lockable
  has_paper_trail only: %i[email encrypted_password]
  rolify role_join_table_name: :user_roles

  has_one :profile, dependent: :destroy

  accepts_nested_attributes_for :profile

  delegate :image, to: :profile, prefix: true

  def screen_name
    profile&.screen_name || email.split('@').first
  end

  def role?(*roles)
    @roles ||= self.roles.pluck(:name)
    (@roles & roles.map(&:to_s)).any?
  end
end
