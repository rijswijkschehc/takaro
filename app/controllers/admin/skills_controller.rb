# frozen_string_literal: true

module Admin
  class SkillsController < AdminController
    def index
      @skills = Skill.all
    end

    def new; end

    def create
      if @skill.update(safe_params)
        redirect_to admin_skills_path
      else
        render :new
      end
    end

    def show; end

    def update
      if @skill.update(safe_params)
        redirect_to admin_skill_path(@skill)
      else
        render :show
      end
    end

    private

    def safe_params
      params.require(:skill).permit(:description, :name)
    end

    def authorize_action
      @skill =
        case action_name
        when 'index' then authorize(Skill)
        when 'new', 'create' then authorize(Skill.new)
        when 'show', 'update' then authorize(Skill.find(params[:id]))
        else
          raise NotAuthorizedError
        end
    end
  end
end
