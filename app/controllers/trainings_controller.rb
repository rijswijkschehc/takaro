# frozen_string_literal: true

class TrainingsController < PrivateController
  prepend_before_action :set_training, only: %i[new create show edit update]
  before_action { add_breadcrumb(_('Trainings'), trainings_path) }

  def index
    @trainings = Training.all
  end

  def new; end

  def create
    if @training.update(safe_params)
      redirect_to trainings_path
    else
      render :new
    end
  end

  def show
    add_breadcrumb(@training.title)
  end

  def edit
    add_breadcrumb(@training.title)
  end

  def update
    add_breadcrumb(@training.title)

    if @training.update(safe_params)
      redirect_to trainings_path
    else
      render :edit
    end
  end

  private

  def safe_params
    params.require(:training).permit(:objective, :step_id, :title, principle_ids: [])
  end

  def set_training
    @training =
      case action_name
      when 'new' then Training.new
      when 'create' then Training.new(safe_params)
      when 'show' then Training.includes(comments: :rich_text_content).find(params[:id])
      when 'edit', 'update' then Training.find(params[:id])
      else
        raise NotImplementedError
      end
  end

  def authorize_user
    authorize(@training || Training)
  end
end
