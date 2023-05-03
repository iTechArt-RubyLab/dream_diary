class DreamsController < ApplicationController
  before_action :find_dream, only: %i[show destroy]

  def new
    @dream = Dream.new
  end

  def create
    @dream = current_user.dreams.create(dream_params)
    redirect_to root_path
  end

  def show
    render :error, status: :not_found unless @dream
    @comments = @dream.comments.where(parent_id: nil)
  end

  def destroy
    @dream.destroy
    redirect_to root_path
  end

  private

  def dream_params
    params.require(:dream).permit(:date, :duration, :title, :description, :image, :tags, :category_id)
  end

  def find_dream
    @dream = Dream.find_by(id: params[:id])
  end
end
