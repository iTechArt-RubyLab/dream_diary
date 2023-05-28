class CommentsController < ApplicationController
  before_action :find_dream
  before_action :find_comment, only: %i[edit update destroy]
  load_and_authorize_resource

  def new
    @comment = @dream.comments.new(parent_id: params[:parent_id])
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

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to dream_path(@dream)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to dream_path(@dream)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :dream_id, :parent_id)
  end

  def find_dream
    @dream = Dream.find(params[:dream_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end
end
