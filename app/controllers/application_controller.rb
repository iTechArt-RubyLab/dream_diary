class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :moon_phase_data

  private

  def moon_phase_data
    cookies[:moon_phase] ||= { value: MoonPhase.phase(request).to_json, expires: Time.zone.now + 1.hour }
    @moon_phase_data = JSON.parse(cookies[:moon_phase]).symbolize_keys
  end
end
