# frozen_string_literal: true

class PrinciplesController < PrivateController
  prepend_before_action :set_principle, only: %i[show]
  before_action { add_breadcrumb(_('8 tactical principles'), principles_path) }

  def index
    @principles = Principle.order(:position)
    @steps = Step.order(:position)
  end

  def show
    @principles = Principle.order(:position)

    add_breadcrumb(@principle.name)
  end

  private

  def set_principle
    @principle = Principle.includes(principle_steps: %i[rich_text_description step]).find(params[:id])
  end

  def authorize_user
    authorize(@principle || Principle)
  end
end
