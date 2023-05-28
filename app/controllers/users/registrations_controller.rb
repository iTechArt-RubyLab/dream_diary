module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: :create

    def create
      super { |user| user.avatar.attach(params[:avatar]) if params[:avatar].present? }
    end

    protected

    def after_inactive_sign_up_path_for(resource)
      new_user_session_path
    end

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email avatar])
    end
  end
end
