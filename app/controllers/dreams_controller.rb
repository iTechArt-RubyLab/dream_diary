class DreamsController < ApplicationController
  before_action :find_dream, only: %i[index show destroy]

  def index
    @dreams = Dream.all
  end

  def show
    render :error, status: :not_found unless @dream
  end

  def destroy
    @dream.destroy
    redirect_to root_path
  end

  private

  def find_dream
    @dream = Dream.find_by(id: params[:id])
  end
end
