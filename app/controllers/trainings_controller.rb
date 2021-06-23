# frozen_string_literal: true

class TrainingsController < PrivateController
  def index
    @trainings = authorize(Training.all).decorate
  end

  def new
    @training = authorize(Training.new)
  end

  def create
    @training = authorize(Training.new(safe_params))

    if @training.update(safe_params)
      redirect_to trainings_path
    else
      render :new
    end
  end

  def show
    @training = authorize(Training.find(params[:id]))
  end

  def update
    @training = authorize(Training.find(params[:id]))

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
end
