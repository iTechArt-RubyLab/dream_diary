class CommentsController < ApplicationController

  def create
    @dream = Dream.find_by(id: params[:dream_id])
    @comment = @dream.comments.create(comment_params.merge(user: current_user))
    redirect_to dream_path(@dream)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :dream_id, :parent_id)
  end
end
