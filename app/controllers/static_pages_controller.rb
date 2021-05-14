# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def show
    @static_page = StaticPage.find_by!(path: params[:path])
  end
end
