module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: :create

    def create
      super do |user|
        if params[:avatar].present?
          user.avatar.attach(params[:avatar])
        else
          user.avatar.attach(io: File.open('app/assets/images/default_avatar.jpg'), filename: 'default_avatar.jpg')
        end
      end
    end

    protected

    def after_inactive_sign_up_path_for(_resource)
      new_user_session_path
    end

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email avatar])
    end
  end
end
