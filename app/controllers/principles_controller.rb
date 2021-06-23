# frozen_string_literal: true

class PrinciplesController < PrivateController
  def index
    @principles = Principle.order(:position)
  end

  def show
    @principle = Principle.includes(principle_steps: %i[rich_text_description step]).find(params[:id])
    @principles = Principle.order(:position)
  end
end
