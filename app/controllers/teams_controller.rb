# frozen_string_literal: true

class TeamsController < PrivateController
  prepend_before_action :set_team, only: %i[show]
  before_action { add_breadcrumb(_('Teams')) }

  def show
    add_breadcrumb(@team.name)
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def authorize_user
    authorize(@team || Team)
  end
end
