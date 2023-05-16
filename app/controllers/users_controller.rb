class UsersController < ApplicationController
  def show
    @dreams = current_user.dreams.order(created_at: :desc)
  end

  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to user_path, notice: 'Profile updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end
end
