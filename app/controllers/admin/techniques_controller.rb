# frozen_string_literal: true

module Admin
  class TechniquesController < AdminController
    def index
      @techniques = Technique.all
    end

    def new; end

    def create
      if @technique.update(safe_params)
        redirect_to admin_techniques_path
      else
        render :new
      end
    end

    def show; end

    def update
      if @technique.update(safe_params)
        redirect_to admin_technique_path(@technique)
      else
        render :show
      end
    end

    private

    def safe_params
      params.require(:technique).permit(:description, :grip, :name, :video)
    end

    def authorize_action
      @technique =
        case action_name
        when 'index' then authorize(Technique)
        when 'new', 'create' then authorize(Technique.new)
        when 'show', 'update' then authorize(Technique.find(params[:id]))
        else
          raise NotAuthorizedError
        end
    end
  end
end
