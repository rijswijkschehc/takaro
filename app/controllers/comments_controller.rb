# frozen_string_literal: true

class CommentsController < PrivateController
  extend Memoist

  helper_method :comment, :commentable

  def show; end

  def edit; end

  def reload
    respond_to do |format|
      format.turbo_stream
    end
  end

  def update
    if comment.update(safe_params)
      redirect_to comment
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    comment.destroy

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def comment
    Comment.find(params[:id])
  end
  memoize :comment

  def commentable
    comment.commentable
  end
  memoize :commentable

  def safe_params
    params.require(:comment).permit(:content)
  end

  def authorize_user
    authorize(comment)
  end
end
