# frozen_string_literal: true

class TrainingsController < PrivateController
  before_action { add_breadcrumb(_('Trainings'), trainings_path) }

  def index
    @trainings = Training.all
  end

  def new
    @training = Training.new
  end

  def create
    @training = Training.new(safe_params)

    if @training.update(safe_params)
      redirect_to trainings_path
    else
      render :new
    end
  end

  def show
    @training = Training.find(params[:id])

    add_breadcrumb(@training.title)
  end

  def edit
    @training = Training.find(params[:id])

    add_breadcrumb(@training.title)
  end

  def update
    @training = Training.find(params[:id])

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
end
