# frozen_string_literal: true

class TrainingsController < PrivateController
  def index
    @trainings = Training.all.decorate
  end

  def new; end

  def create
    if @training.update(safe_params)
      redirect_to trainings_path
    else
      render :new
    end
  end

  def show; end

  def update
    if @training.update(safe_params)
      redirect_to trainings_path
    else
      render :show
    end
  end

  private

  def safe_params
    params.require(:training).permit(:objective, :step_id, :title, principle_ids: [])
  end

  def authorize_action
    @training =
      case action_name
      when 'index', 'new', 'create' then authorize(Training.new)
      when 'show', 'update', 'destroy' then authorize(Training.find(params[:id]))
      else
        raise NotAuthorizedError
      end
  end
end
