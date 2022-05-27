# frozen_string_literal: true

class StepsController < PrivateController
  before_action { add_breadcrumb(_('3 methodical steps'), steps_path) }

  def index
    @steps = Step.order(:position)
  end
end
