class DreamsController < ApplicationController
  before_action :find_dream, only: %i[show destroy]

  def show
    render :error, status: :not_found unless @dream
    @comments = @dream.comments.where(parent_id: nil)
  end

  def destroy
    @dream.destroy
    redirect_to category_path(params[:category_id])
  end

  private

  def find_dream
    @dream = Dream.find_by(id: params[:id])
  end
end
