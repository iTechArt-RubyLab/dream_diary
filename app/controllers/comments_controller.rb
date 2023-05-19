class CommentsController < ApplicationController
  before_action :find_dream

  def new
    @comment = @dream.comments.new
  end

  def create
    @comments = @dream.comments.where(parent_id: nil)
    @comment = @dream.comments.new(comment_params.merge(user: current_user))
    if @comment.save
      respond_to do |format|
        format.html { redirect_to dream_path(@dream) }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :dream_id, :parent_id)
  end

  def find_dream
    @dream = Dream.find_by(id: params[:dream_id])
  end
end
