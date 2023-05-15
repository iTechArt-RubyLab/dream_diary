module MoonPhase
  module_function

  include Constants

  def phase(request)
    coordinates = request.local? ? MINSK_COORDINATES : request.location.coordinates.join(',')
    url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/#{coordinates}/today"
    params = {
      key: ENV['MOON_KEY'],
      include: 'timezone,days',
      elements: 'datetime,moonphase,sunrise,sunset,moonrise,moonset'
    }
    response = HTTParty.get(url, query: params).parsed_response.slice('timezone', 'days')
    response['days'].each { |day| day['moonphase_name'] = represent_phase(day['moonphase']) }
    response
  end

  def represent_phase(phase)
    MOON_PHASES.each do |range, phase_name|
      return phase_name if range === phase
    end
    'Invalid moon phase'
  end
end
