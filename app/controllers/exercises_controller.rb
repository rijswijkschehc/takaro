# frozen_string_literal: true

class ExercisesController < PrivateController
  prepend_before_action :set_exercise, only: %i[new create show edit update]
  before_action :add_breadcrumbs

  def index
    @exercises = Exercise.all
  end

  def new; end

  def create
    if @exercise.save
      redirect_to exercises_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
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

  def set_exercise
    @exercise =
      case action_name
      when 'new' then Exercise.new
      when 'create' then Exercise.new(safe_params)
      when 'show' then Exercise.includes(comments: :rich_text_content).find(params[:id])
      when 'edit', 'update' then Exercise.find(params[:id])
      else
        raise NotImplementedError
      end
  end

  def authorize_user
    authorize(@exercise || Exercise)
  end

  def add_breadcrumbs
    add_breadcrumb(_('Exercises'), exercises_path)
    add_breadcrumb(@exercise.title) if @exercise&.title
  end
end
