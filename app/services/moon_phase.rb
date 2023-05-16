module MoonPhase
  module_function

  def phase(request)
    coordinates = request.local? ? Constants::MINSK_COORDINATES : request.location.coordinates.join(',')
    url = Constants::MOON_API_URL + "/#{coordinates}/today"
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
    Constants::MOON_PHASES.each do |range, phase_name|
      return phase_name if range === phase
    end
    'Invalid moon phase'
  end
end
