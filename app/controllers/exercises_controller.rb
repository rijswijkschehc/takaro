# frozen_string_literal: true

class ExercisesController < PrivateController
  def index
    @exercises = Exercise.all
  end

  def new; end

  def create
    if @exercise.update(safe_params)
      redirect_to exercises_path
    else
      render :new
    end
  end

  def show; end

  def update
    if @exercise.update(safe_params)
      redirect_to exercises_path
    else
      render :show
    end
  end

  private

  def safe_params
    params.require(:exercise).permit(:description, :objective, :step_id, :tips, :title, :variation, :video,
                                     principle_ids: [], technique_ids: [])
  end

  def authorize_action
    @exercise =
      case action_name
      when 'index', 'new', 'create' then authorize(Exercise.new)
      when 'show', 'update', 'destroy' then authorize(Exercise.find(params[:id]))
      else
        raise NotAuthorizedError
      end
  end
end
