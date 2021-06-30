# frozen_string_literal: true

class ExercisesController < PrivateController
  before_action { add_breadcrumb(_('Exercises'), exercises_path) }

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

    add_breadcrumb(@exercise.title)
  end

  def edit
    @exercise = Exercise.find(params[:id])

    add_breadcrumb(@exercise.title)
  end

  def update
    @exercise = Exercise.find(params[:id])

    add_breadcrumb(@exercise.title)

    if @exercise.update(safe_params)
      redirect_to exercises_path
    else
      render :edit
    end
  end

  private

  def safe_params
    params.require(:exercise).permit(:description, :objective, :step_id, :tips, :title, :variation, :video,
                                     principle_ids: [], technique_ids: [])
  end
end
