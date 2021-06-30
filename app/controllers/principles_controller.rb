# frozen_string_literal: true

class PrinciplesController < PrivateController
  before_action { add_breadcrumb(_('8 tactical principles'), principles_path) }

  def index
    @principles = Principle.order(:position)
    @steps = Step.order(:position)
  end

  def show
    @principle = Principle.includes(principle_steps: %i[rich_text_description step]).find(params[:id])
    @principles = Principle.order(:position)

    add_breadcrumb(@principle.name)
  end
end
