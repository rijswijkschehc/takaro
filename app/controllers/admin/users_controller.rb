# frozen_string_literal: true

module Admin
  class UsersController < AdminController
    before_action { add_breadcrumb(_('Users'), admin_users_path) }

    def index
      @users = User.all.decorate
    end
  end
end
