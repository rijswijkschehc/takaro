# frozen_string_literal: true

class CommentsController < PrivateController
  before_action :set_comment

  def show; end

  def edit; end

  def reload
    respond_to do |format|
      format.turbo_stream
    end
  end

  def update
    if @comment.update(safe_params)
      redirect_to @comment
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def safe_params
    params.require(:comment).permit(:content)
  end
end
