# frozen_string_literal: true

class ProfileController < PrivateController
  def show
    current_user.build_person if current_user.person.nil?
  end

  def update
    if current_user.update(safe_params)
      redirect_to profile_path
    else
      render :show
    end
  end

  private

  def safe_params
    params.require(:user).permit(person_attributes: %i[screen_name])
  end

  def authorize_action
    authorize(:profile, :show?)
  end
end
