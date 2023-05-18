class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :moon_phase_data
  before_action :set_locale

  rescue_from CanCan::AccessDenied do |e|
    redirect_to new_user_session_path, alert: e.message
  end

  private

  def moon_phase_data
    cookies[:moon_phase] ||= { value: MoonPhase.phase(request).to_json, expires: Time.zone.now + 1.hour }
    @moon_phase_data = JSON.parse(cookies[:moon_phase]).deep_symbolize_keys
  end

  def set_locale
    I18n.locale = params[:locale] || cookies[:locale] ||
                  http_accept_language.compatible_language_from(I18n.available_locales)
    cookies[:locale] = I18n.locale if params[:locale]
  end
end
