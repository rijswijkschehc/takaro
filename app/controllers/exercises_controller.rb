# frozen_string_literal: true

class ExercisesController < PrivateController
  def index
    @exercises = authorize(Exercise.all)
  end

  def new
    @exercise = authorize(Exercise.new)
  end

  def create
    @exercise = authorize(Exercise.new(safe_params))

    if @exercise.save
      redirect_to exercises_path
    else
      render :new
    end
  end

  def show
    @exercise = authorize(Exercise.find(params[:id])).decorate
  end

  def update
    @exercise = authorize(Exercise.find(params[:id]))

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
end
