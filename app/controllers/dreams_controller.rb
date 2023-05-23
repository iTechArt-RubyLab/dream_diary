class DreamsController < ApplicationController
  before_action :find_dream, only: %i[show edit update destroy]
  authorize_resource

  def index
    @dreams = Dream.order(created_at: :desc)
  end

  def new
    @dream = Dream.new
  end

  def create
    @dream = current_user.dreams.new(dream_params)
    if @dream.save
      set_tags
      redirect_to dream_path(@dream)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @dream.update(dream_params)
      set_tags
      redirect_to dream_path(@dream)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    render :error, status: :not_found unless @dream
    @comments = @dream.comments.where(parent_id: nil)
    respond_to do |format|
      format.html
      format.csv { send_data @dream.to_csv, filename: %(dreams-#{DateTime.now.strftime('%d%m%Y%H%M')}.csv) }
    end
  end

  def destroy
    @dream.destroy
    redirect_to user_path(current_user)
  end

  private

  def dream_params
    params.require(:dream).permit(:date, :duration, :title, :description, :image, :category_id)
  end

  def tags_params
    params[:dream][:tags].reject(&:blank?)
  end

  def find_dream
    @dream = Dream.find_by(id: params[:id])
  end

  def set_tags
    @tags = Tag.where(name: tags_params)
    @dream.tag_ids = @tags.pluck(:id)
  end
end
