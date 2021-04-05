# frozen_string_literal: true

module Admin
  class UsersController < AdminController
    def index
      @users = User.all.decorate
    end

    private

    def authorize_action
      authorize(User)
    end
  end
end
