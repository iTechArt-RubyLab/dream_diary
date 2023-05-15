module MoonPhase
  module_function

  def phase(request)
    coordinates = request.location.coordinates.join(',')
    url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/#{coordinates}/today"
    params = {
      key: ENV['MOON_KEY'],
      include: 'days',
      elements: 'datetime,moonphase,sunrise,sunset,moonrise,moonset'
    }
    location_data = request.location.data.symbolize_keys.slice(:city, :region, :country, :timezone)
    HTTParty.get(url, query: params).parsed_response['days'].first.merge(location_data)
  end
end
