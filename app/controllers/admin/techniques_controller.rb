# frozen_string_literal: true

module Admin
  class TechniquesController < AdminController
    def index
      @techniques = authorize(Technique.all)
    end

    def new
      @technique = authorize(Technique.new)
    end

    def create
      @technique = authorize(Technique.new(safe_params))

      if @technique.save
        redirect_to admin_techniques_path
      else
        render :new
      end
    end

    def show
      @technique = authorize(Technique.find(params[:id]))
    end

    def update
      @technique = authorize(Technique.find(params[:id]))

      if @technique.update(safe_params)
        redirect_to admin_techniques_path
      else
        render :show
      end
    end

    private

    def safe_params
      params.require(:technique).permit(:description, :grip, :name, :video)
    end
  end
end
