# frozen_string_literal: true

module Admin
  class UsersController < AdminController
    def index
      @users = authorize(User.all).decorate
    end
  end
end
