# frozen_string_literal: true

class ExercisesController < PrivateController
  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(safe_params)

    if @exercise.save
      redirect_to exercises_path
    else
      render :new
    end
  end

  def show
    @exercise = Exercise.find(params[:id]).decorate
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])

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
