# frozen_string_literal: true

class StepsController < PrivateController
  def index
    @steps = Step.order(:position)
  end
end
