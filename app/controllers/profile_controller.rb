# frozen_string_literal: true

class ProfileController < PrivateController
  def show
    current_user.build_person if current_user.person.nil?
  end

  def update
    if successful_update?
      bypass_sign_in(current_user) if safe_params.fetch(:password).present?

      redirect_to profile_path, flash: { success: _('Profile updated successfully') }
    else
      render :show
    end
  end

  private

  def successful_update?
    if require_current_password?
      current_user.update_with_password(safe_params)
    else
      current_user.update_without_password(safe_params.except(:current_password))
    end
  end

  def require_current_password?
    safe_params.fetch(:password).present? || (safe_params.fetch(:email) != current_user.email)
  end

  def safe_params
    params.require(:user).permit(:email, :current_password, :password, :password_confirmation,
                                 person_attributes: %i[id screen_name])
  end

  def authorize_action
    authorize(:profile, :show?)
  end
end
